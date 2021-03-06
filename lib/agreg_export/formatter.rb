module AgregExport

  class ExportMethodMissingError < StandardError
  end

  class Formatter

    def initialize(data_collector)
      @data_collector = data_collector
    end

    def self.export(data_collector, *options)
      new(data_collector).export(*options)
    end

    def export(*options)
      raise ExportMethodMissingError.new 'export method must be implemented by subclass !'
    end

  end

end
