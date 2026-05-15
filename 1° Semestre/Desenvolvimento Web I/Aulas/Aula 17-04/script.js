class Aluno {

    constructor(nome, idade, curso, semestre) {
        this.nome = nome;
        this.idade = idade,
        this.curso = curso;
        this.semestre = semestre;
    }

    apresentar() {
        console.log(`Seja muito bem vindo(a) ${this.nome}. Sua idade é: ${this.idade} e você está no ${this.semestre} do curso de ${this.curso}`)
    }
}

let nome = "Thiago Rodrigues dos Santos";
let idade = 18;
let semestre = "1° Semestre";
let curso = "Desenvolvimento de Software Multiplataforma";

const aluno = new Aluno(nome, idade, curso, semestre);
aluno.apresentar();