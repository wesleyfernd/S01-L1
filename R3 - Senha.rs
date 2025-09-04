use std::io;

fn verificar_senha(senha: &str) -> bool {
    // Critério 1: pelo menos 8 caracteres
    if senha.len() < 8 {
        return false;
    }

    // Critério 2: pelo menos um número
    let contem_numero = senha.chars().any(|c| c.is_digit(10));

    // Critério 3: pelo menos uma letra maiúscula
    let contem_maiuscula = senha.chars().any(|c| c.is_ascii_uppercase());

    contem_numero && contem_maiuscula
}

fn main() {
    loop {
        println!("Digite uma senha:");

        let mut senha = String::new();
        io::stdin()
            .read_line(&mut senha)
            .expect("Falha ao ler a entrada");

        let senha = senha.trim(); // remove espaços e quebras de linha

        if verificar_senha(senha) {
            println!("Senha válida! Acesso concedido.");
            break;
        } else {
            println!("Senha inválida! Tente novamente.");
        }
    }
}
