# Encontre

Wrapper amigável para o comando `find` do Linux, oferecendo sintaxe simplificada e recursos adicionais.

## Descrição

O Encontre é uma ferramenta de linha de comando que simplifica a busca de arquivos e diretórios no Linux. Desenvolvido como um wrapper para o comando `find`, proporciona uma interface mais intuitiva mantendo toda a potência da ferramenta original.

## Recursos

- Sintaxe simplificada e intuitiva
- Colorização de saída seguindo o padrão `ls`
- Contador de resultados
- Indicadores visuais de tipo de arquivo
- Filtros avançados por tamanho, data e tipo
- Salvamento de resultados em arquivo
- Disponível através dos comandos `encontre` e `encontrar`

## Instalação

### Fedora / RHEL / CentOS

Via COPR:
```bash
sudo dnf copr enable richarddalves/encontre
sudo dnf install encontre
```

### Ubuntu / Debian

Via PPA:
```bash
sudo add-apt-repository ppa:richarddalves/encontre
sudo apt update
sudo apt install encontre
```

### Instalação Manual

Baixe o pacote apropriado na página de [Releases](https://github.com/richarddalves/encontre/releases) ou instale diretamente o script:

```bash
# Download direto do script
wget https://raw.githubusercontent.com/richarddalves/encontre/main/bin/encontre
chmod +x encontre
sudo mv encontre /usr/local/bin/
sudo ln -s /usr/local/bin/encontre /usr/local/bin/encontrar
```

## Requisitos

- bash >= 4.0
- findutils
- coreutils
- bc

## Uso

### Sintaxe Básica

```bash
encontre [diretório] [opções...]
```

### Exemplos Fundamentais

```bash
# Buscar todos os arquivos no diretório atual
encontre .

# Ignorar diretórios específicos
encontre . --ignore .git node_modules

# Buscar apenas arquivos com extensão específica
encontre . --apenas *.py

# Contar resultados ao invés de listar
encontre . --contar
```

### Opções de Busca

#### Ignorar Arquivos/Diretórios
```bash
encontre . --ignore PADRÃO...
encontre . -i PADRÃO...

# Exemplos
encontre . --ignore .git/              # Ignora diretório .git
encontre . -i node_modules *.log       # Ignora múltiplos padrões
```

#### Filtrar por Padrões
```bash
encontre . --apenas PADRÃO...
encontre . -a PADRÃO...

# Exemplos
encontre . --apenas *.md *.txt         # Apenas markdown e texto
encontre . -a test_*.py                # Apenas testes Python
```

### Opções de Filtro

#### Por Tipo
```bash
encontre . --tipo [arquivo|diretorio]
encontre . -t [a|d]

# Exemplos
encontre . --tipo arquivo              # Tudo exceto diretórios
encontre . -t d                        # Apenas diretórios
```

#### Por Tamanho
```bash
encontre . --tamanho OPERADOR+TAMANHO
encontre . -t OPERADOR+TAMANHO

# Operadores: + (maior), - (menor), = (igual)
# Unidades: b, kb, mb, gb, tb (ou kib, mib, gib, tib)

# Exemplos
encontre . --tamanho +10mb             # Maiores que 10MB
encontre . -t -1gb                     # Menores que 1GB
encontre . --tamanho =5kb              # Exatamente 5KB
```

#### Por Data de Modificação
```bash
encontre . --modificado TEMPO
encontre . -m TEMPO

# Formatos: min, h, d, m (minutos, horas, dias, meses)

# Exemplos
encontre . --modificado 7d             # Últimos 7 dias
encontre . -m 2h                       # Últimas 2 horas
```

### Opções de Saída

#### Indicadores de Tipo
```bash
encontre . --indicadores               # Mostra todos: /, *, @, |
encontre . -i                          # Mesmo efeito
encontre . --indicador-simples         # Apenas / para diretórios
encontre . --is                        # Mesmo efeito
```

#### Cores
```bash
encontre . --no-color                  # Desabilita cores
encontre . --nc                        # Mesmo efeito
encontre . --sem-cor                   # Mesmo efeito
encontre . --sc                        # Mesmo efeito
```

#### Salvar Resultados
```bash
encontre . --salvar arquivo.txt
encontre . -s lista.txt

# Exemplo
encontre . --apenas *.log --salvar logs.txt
```

### Combinando Opções

```bash
# Buscar arquivos Python grandes modificados recentemente
encontre . --apenas *.py --tamanho +1mb --modificado 7d

# Contar arquivos ignorando diretórios de build
encontre . --ignore build dist --tipo arquivo --contar

# Salvar lista de diretórios sem cores
encontre . --tipo d --sem-cor --salvar diretorios.txt
```

## Ajuda Contextual

O Encontre oferece ajuda detalhada para cada opção:

```bash
encontre --help                        # Ajuda geral
encontre --tipo --ajuda                # Ajuda sobre tipos
encontre --tamanho --ajuda             # Ajuda sobre tamanhos
encontre -a --ajuda                    # Ajuda sobre --apenas
```

## Diferenças do find

| Operação | find | encontre |
|----------|------|----------|
| Ignorar diretório | `find . -name .git -prune -o -print` | `encontre . --ignore .git` |
| Apenas arquivos | `find . -type f` | `encontre . --tipo arquivo` |
| Por tamanho | `find . -size +10M` | `encontre . --tamanho +10mb` |
| Últimos 7 dias | `find . -mtime -7` | `encontre . --modificado 7d` |

## Desenvolvimento

### Estrutura do Projeto

```
encontre/
├── bin/
│   └── encontre           # Script principal
├── packaging/
│   ├── debian/            # Arquivos para empacotamento Debian
│   └── rpm/               # Arquivos para empacotamento RPM
├── LICENSE
├── Makefile
└── README.md
```

### Construindo Pacotes

```bash
# Construir pacote RPM
make rpm

# Construir pacote DEB
make deb

# Instalar localmente
sudo make install
```

## Contribuindo

Contribuições são bem-vindas. Por favor:

1. Faça fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-funcionalidade`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## Reportando Problemas

Encontrou um bug ou tem uma sugestão? Abra uma [issue](https://github.com/richarddalves/encontre/issues).

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

## Autor

Richard Dias Alves
- GitHub: [@richarddalves](https://github.com/richarddalves)
- Email: dev@richardalves.com