# frozen_string_literal: true

module CodenamePHP
  module Gnome
    module GSettings
      SCHEMA_DESKTOP_SESSION = 'org.gnome.desktop.session'
      SCHEMA_PLUGINS_MEDIA_KEYS = 'org.gnome.settings-daemon.plugins.media-keys'
      SCHEMA_PLUGINS_MEDIA_KEYS_CUSTOM_KEYBINDING = "#{SCHEMA_PLUGINS_MEDIA_KEYS}.custom-keybinding"

      KEY_DESKTOP_SESSION_IDLE_DELAY = 'idle-delay'
      KEY_PLUGINS_MEDIA_KEYS_CUSTOM_KEYBINDINGS = 'custom-keybindings'

      module Keys
        SUPER = '<Super>'
        CTRL = '<Control>'
        ALT = '<Alt>'
        SHIFT = '<Shift>'
        SPACE = 'space'
        SLASH = 'slash'

        KP_DIVIDE = 'KP_Divide'
        KP_MULTIPLY = 'KP_Multiply'
      end
    end
  end
end
