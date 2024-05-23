# 📱 Astronomy App

![GitHub repo size](https://img.shields.io/github/repo-size/devRenata/AstronomyApp?style=for-the-badge)
![GitHub language count](https://img.shields.io/github/languages/count/devRenata/AstronomyApp?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/devRenata/AstronomyApp?style=for-the-badge)

<img align="center" src="https://images.pexels.com/photos/41951/solar-system-emergence-spitzer-telescope-telescope-41951.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="Ilustração da galáxia vermelha e laranja">

> O Projeto Astronomy App foi desenvolvido junto ao canal Caju Code, onde é mostrado como aplicar conhecimentos em TDD e Clean Architecture.

## Visão Geral

Este projeto utiliza a API da NASA [APOD](https://api.nasa.gov/) (Astronomy Picture of the Day) para fornecer imagens e vídeos sobre o espaço sideral. A principal motivação por trás deste projeto foi aplicar conceitos avançados de desenvolvimento de software na prática, com ênfase em Test-Driven Development (TDD) e arquitetura limpa (Clean Architecture).

### Funcionalidades Principais:

- Exibição da Imagem do Dia: A aplicação permite aos usuários visualizar a imagem do espaço correspondente a uma determinada data.

- Detalhes e Informações Adicionais: Além da imagem do dia, a aplicação exibe informações detalhadas sobre a imagem, incluindo sua descrição, créditos e qualquer dado relevante fornecido pela API.

- Navegação por Datas Anteriores: Os usuários podem explorar imagens anteriores do espaço selecionando datas específicas.

### Ajustes e melhorias

O projeto ainda está em desenvolvimento e as próximas atualizações serão voltadas nas seguintes tarefas:

- [x] Testes unitários e automatizados
- [x] Injeção de dependências
- [x] Consumir dados de uma API
- [x] Gerenciamento de estado com BLoC
- [ ] Rotas de navegação
- [ ] Salvar dados localmente
- [ ] Verificação de conexão
- [ ] Compartilhar conteúdo
- [ ] Salvar imagens na galeria
- [ ] Trabalhar com datas

## 🔧 Tecnologias Utilizadas

1. Flutter: A aplicação foi desenvolvida utilizando o framework Flutter, permitindo a criação de interfaces de usuário responsivas e dinâmicas para dispositivos móveis.

2. Test-Driven Development (TDD): A metodologia de desenvolvimento TDD foi empregada para garantir a qualidade do código e a funcionalidade correta das diferentes partes da aplicação.

3. Clean Architecture: A arquitetura limpa foi adotada para promover a separação de responsabilidades, facilitar a manutenção do código e garantir sua escalabilidade a longo prazo.

4. BLoC (Business Logic Component): Para o gerenciamento de estado, utilizei o padrão BLoC, uma abordagem popular que ajuda a manter o estado da aplicação de forma organizada e reativa.


## 📫 Contribuindo para o Astronomy App

Para contribuir com projeto, siga estas etapas:

1. Bifurque este repositório.
2. Crie um branch: `git checkout -b <nome_branch>`.
3. Faça suas alterações e confirme-as: `git commit -m '<mensagem_commit>'`
4. Envie para o branch original: `git push origin <nome_do_projeto>`
5. Crie a solicitação de pull.

Caso tenha alguma dúvida, consulte a documentação do GitHub em [como criar uma solicitação pull](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).