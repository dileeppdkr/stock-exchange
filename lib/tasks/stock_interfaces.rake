namespace :stock do

  desc 'Interactive Stock Console.'
  task interactive_console: :environment do
    include TranslationHelper
    while true
      begin 
        command = STDIN.gets.strip
        command_hash = TranslationHelper.translate_command(command)
        stock = run_command(command_hash)
      rescue Exception => e
        puts "Problem with the input : " + e.to_s
        return
      end
    end
  end

  def run_command(hash)
    if hash[:method] == "buy" || hash[:method] == 'sell'
      # puts "=-=-=-=-=- #{hash[:method]}"
      # puts "-=-=-=-=-=#{hash[:args]}"
      StockExchange.new.send(hash[:method], *hash[:args])
    else
      puts INITIALIZATION_ERROR
    end
  end
end


