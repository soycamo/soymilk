module LangcodeHelper
  def self.option_list
    #ISO_639::ISO_639_2.collect{|a| {code: a.alpha3, eng_name: a.english_name} }
    ISO_639::ISO_639_2
      .sort_by{ |a| a.english_name }
      .collect{|a| [a.english_name,a.alpha3] }
  end
end

Soymilk::App.helpers LangcodeHelper
