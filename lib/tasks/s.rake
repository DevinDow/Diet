task "s" => :environment do
  system 'rails server -p 3001'
end
