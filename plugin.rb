
after_initialize do
  if SiteSetting.allow_user_locale
    class ::SiteSetting
      module SiteSettingExtensions
        def available_locales
          LocaleSiteSetting.values.select do |locale|
            available_interface_locales.include?(locale[:value])
          end.to_json
        end
      end
      singleton_class.prepend SiteSettingExtensions
    end
  end
end
