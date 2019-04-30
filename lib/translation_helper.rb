module TranslationHelper
  class << self
    def translate_command(string)     
      command_args = string.split(' ')
      method = command_args.shift
      puts method
      sanitized_args = []
      command_args.each do |arg|
        sanitized_args << sanitize_input(arg)
      end
      # puts sanitized_args
      # puts '-=-=-=-=-=-='
      {method: method, args: sanitized_args}
    end

    def sanitize_input(x)
      (x.to_i.to_s == x) ? x.to_i : x
    end
  end   
end



