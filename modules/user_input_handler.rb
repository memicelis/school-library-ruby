module UserInputHandler
  def get_user_input(prompt)
    puts prompt
    gets.chomp
  end

  def get_user_input_as_integer(prompt)
    get_user_input(prompt).to_i
  end
end
