# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@fatec = Institution.create(
  name: "Fatec"
)

puts "Cadastrando Cursos"
begin
  @ads = Course.create!(
    name: "Análise e Desenvolviment de Sistemas",
    institution: @fatec
  )
  
  @si = Course.create!(
    name: "Segurança da Informação",
    institution: @fatec
  )
  
  @log = Course.create!(
    name: "Logística",
    institution: @fatec
  )
  
  @textil = Course.create!(
    name: "Têxtil e Moda",
    institution: @fatec
  )
rescue => exception
  puts "Deu ruim"
end
puts "Deu bom"

puts "Cadastrando matérias"
begin
  @mat = Subject.create!(name: "Matemática")
  @calc = Subject.create!(name: "Cálculo")
  @calc2 = Subject.create!(name: "Cálculo II")
  @prog = Subject.create!(name: "Programação")
  @poo = Subject.create!(name: "POO")
  @redes = Subject.create!(name: "Redes")
  @arq = Subject.create!(name: "Arquitetura")
  @java = Subject.create!(name: "Java")
  @quimica = Subject.create!(name: "Química")
  @linguas = Subject.create!(name: "Línguas")
  @ciencia = Subject.create!(name: "Ciência")
  @est = Subject.create!(name: "Estátistica")

  exatas1 = [@mat, @calc, @prog, @java, @poo]
  exatas2 = [@mat, @calc, @prog, @redes, @arq ]
  exatas3 = [@mat, @calc, @est, @calc2]
  textil = [@mat, @ciencia, @quimica, @linguas]
rescue => exception
  puts "Deu Ruim"  
end
puts "Deu Bom"

puts "Relacionando materias e cursos"
begin
  exatas1.each do |subject|
    @ads.subjects << subject
  end
  
  exatas2.each do |subject|
    @si.subjects << subject
  end
  
  exatas3.each do |subject|
    @log.subjects << subject
  end

  textil.each do |subject|
    @textil.subjects << subject
  end
rescue => exception
  puts "Deu Ruim"
end
puts "Deu Bom"

puts "Criando Usuários"
begin
  @student = User.create(
    name: "estudante",
    email: "estudante@fatec.com",
    course_id: Course.all.sample.id,
    institution_id: @fatec.id,
    kind: 0,
    password: "123456",
    password_confirmation: "123456"
  )
  
  @admin = User.create(
    name: "admin",
    email: "admin@fatec.com",
    course_id: Course.all.sample.id,
    institution_id: @fatec.id,
    kind: 2,
    password: "123456",
    password_confirmation: "123456"
  )
rescue => exception
  puts "Deu ruim"
end
puts "Deu bom"

puts "Criando e relacionando horario -> monitor"
begin
  @monitor = User.new(
    name: "monitor",
    email: "monitor@fatec.com",
    course: Course.all.sample,
    institution: Institution.all.sample,
    kind: 1,
    password: "123456",
    password_confirmation: "123456"
  )

  3.times do
    w = Worktime.create!(
      user: @monitor,
      day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday].sample,
      start_time: 2.hours.from_now,
      end_time: Time.zone.now
    )
    @monitor.worktimes << w
  end
  @monitor.save
  puts "Deu bom"
rescue => exception
  puts exception
  puts "Deu ruim"
end

puts "Criando Quiz"
begin
  @codigo = Questionnaire.create!(
    description: "Quantas linhas de código deve conter um programa?",
    institution: @fatec,
    subject: @prog
  )
  
  @estatistica = Questionnaire.create!(
    description: "Qual a probabilidade de acerto de uma flecha solta aleatoriamente?",
    institution: @fatec,
    subject: @est
  )
  
  3.times do
    ["450", "300", "Não há limite"].each do |opt|
      QuestionnaireOption.create(
        description: opt,
        questionnaire: @codigo,
        correct: false
      )
    end
  end
  
  3.times do
    ["50%", "70%", "25%"].each do |opt|
      QuestionnaireOption.create(
        description: opt,
        questionnaire: @estatistica,
        correct: false
      )
    end
  end
rescue => exception
  puts "Deu ruim"
end
puts "Deu Bom"

puts "Criando grupo de estudos"
begin
  StudyGroup.create!(
    institution: @fatec,
    subject: Subject.all.sample,
    theme: "Estudo exploratório",
    name: "Fatecanos"
  )
rescue => exception
  puts "Deu Ruim"
end
puts "Deu Bom"

puts "Eventos"
begin
  3.times do
    Event.create!(
      description: ["Prova 1", "Prova 2", "Sub"].pop,
      courses_subject: CoursesSubject.all.sample,
      date: rand(30).days.from_now
    )
  end
  puts "Deu Bom"
rescue => exception
  puts "Deu Ruim"
  puts exception
end