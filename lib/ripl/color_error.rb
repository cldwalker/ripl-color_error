require 'ripl'

module Ripl
  module ColorError
    VERSION = '0.1.1'
    COLORS = {:red=>31, :green=>32, :yellow=>33, :blue=>34, :purple=>35, :cyan=>36}

    def format_error(error)
      color_code = config[:color_error].to_s[/^[\d;]+$/] || !config[:color_error] ?
        config[:color_error] : COLORS[config[:color_error].to_sym]
      color_code ? "\e[#{color_code}m#{super}\e[m" : super
    end
  end
end

Ripl::Shell.send :include, Ripl::ColorError
Ripl.config[:color_error] ||= :red
