import 'package:astronomy/app/presentation/state_manager/today_apod_bloc.dart';
import 'package:astronomy/container_injection.dart';
import 'package:flutter/material.dart';

class ApodTodayScreen extends StatefulWidget {
  const ApodTodayScreen({super.key});

  @override
  State<ApodTodayScreen> createState() => _ApodTodayScreenState();
}

class _ApodTodayScreenState extends State<ApodTodayScreen> {
  late TodayApodBloc _bloc;

  @override
  void initState() {
    _bloc = getIt();
    _bloc.input.add(FetchApodTodayEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TodayApodState>(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        TodayApodState? state = snapshot.data;
        Widget body = Container();

        if(state is LoadingTodayApodState) {
          body = const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is ErrorTodayApodState) {
          body = Center(
            child: Text(state.message),
          );
        }
        if(state is SuccessTodayApodState) {
          body = Column(
            children: [
              Text(state.apod.title ?? ""),
              Text(state.apod.explanation ?? ""),
            ],
          );
        }
        return Scaffold(
          body: body,
        );
      },
    );
  }
}
