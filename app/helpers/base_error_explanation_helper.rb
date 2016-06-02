module BaseErrorExplanationHelper
  def base_error_explanation (obj, name=nil)
    if obj.errors[:base].any?
      html=<<-EOF
        <div class='error_explanation'>
          <div class='error_explanation_content'>
            <p class='error_explanation_header'>#{pluralize(obj.errors[:base].size, 'additional error')} prohibited this #{name || obj.class.to_s.humanize.downcase} from being saved:</p>
            <ul>
              #{ obj.errors[:base].map{ |msg| "<li>#{ msg }</li>" }.join }
            </ul>
          </div>
        </div>
        <br />
      EOF
      html.html_safe
    end
  end
end