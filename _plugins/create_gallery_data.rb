module Jekyll
  class CreateYaml < Generator
    def generate(site)
      
      do_it(site)
      

    end            

    def do_it(site)
      gallery_directories = Dir.entries(Dir.pwd + "/img/galleries").select {|entry| File.directory? File.join(Dir.pwd+"/img/galleries",entry) and !(entry =='.' || entry == '..') }
      
      gallery_directories.each do |g|
        create_file(site, g)        
       end
            
    end

    def create_file(site, directory)

      working_dir = site.source + "/img/galleries/" + directory
      #puts working_dir
      
      File.open("_data/" + directory + ".yml", 'w') {|f| 

        Dir.foreach(working_dir) do |item|
          next if item == '.' or item == '..' or item == 'thumbs'
          #puts item
            
          f.write("- path : /img/galleries/" + directory + "/" + item)
          f.puts @string
          f.write("  thumb : /img/galleries/" + directory + "/thumbs/" + item)
          f.puts @string
          f.write("  alt : '" + item + "'")
          f.puts @string
          f.puts @string
                    
        end
       }      

    end

  end
end