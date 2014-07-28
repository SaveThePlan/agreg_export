module AgregExport

  class DataCollector

    @@handlers = []

    def self.data_loader(dataname, &block)
      define_getter dataname
      define_loader(dataname, &block)
    end

    def initialize(load_data = true, only = {})
      hydrate(only, true) if load_data
    end

    def hydrate(only = {}, force_replace = false)
      if only.empty?
        @@handlers.each do |handler_name|
          only[handler_name] = force_replace
        end
      end

      only.each do |name, replace|
        replace ? send(loader_name(name)) : send(name)
      end
    end

    def export_with_formatter(formatter_class, *options)
      formatter_class.export(self, *options)
    end


    private

    def self.define_loader(dataname, &block)
      define_method loader_name(dataname) do
        instance_variable_set("@#{dataname}", block.call)
      end
      private loader_name(dataname)
    end

    def self.define_getter(dataname)
      define_method(dataname) do
        return instance_variable_get "@#{dataname}" if instance_variable_defined? "@#{dataname}"
        send(loader_name(dataname))
      end
      @@handlers << dataname
    end

    def self.loader_name(dataname)
      "load_#{dataname}"
    end

    def loader_name(dataname)
      self.class.loader_name(dataname)
    end


  end

end