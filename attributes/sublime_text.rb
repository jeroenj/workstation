default[:elephant][:sublime_text][:extensions] = {
  'JSON' => %w[Berksfile.lock],
  'Ruby' => %w[Berksfile Cheffile Vagrantfile rabl ru],
  'Sass' => %w[sass],
  'SCSS' => %w[scss],
  'XML' => %w[xml xsd xslt svg terminal plist],
  'YAML' => %w[Procfile.dev yml.example]
}
default[:elephant][:sublime_text][:packages] = [
  { 'name' => 'AdvancedNewFile', 'source' => 'https://github.com/skuroda/Sublime-AdvancedNewFile' },
  { 'name' => 'CoffeeScript', 'source' => 'https://github.com/Xavura/CoffeeScript-Sublime-Plugin' },
  { 'name' => 'CoffeeCompile', 'source' => 'https://github.com/surjikal/sublime-coffee-compile' },
  { 'name' => 'FileDiffs', 'source' => 'https://github.com/colinta/SublimeFileDiffs' },
  { 'name' => 'GitGutter', 'source' => 'https://github.com/jisaacks/GitGutter' },
  { 'name' => 'HTML2HAML', 'source' => 'https://github.com/pavelpachkovskij/sublime-html-to-haml' },
  { 'name' => 'Indent XML', 'source' => 'https://github.com/alek-sys/sublimetext_indentxml' },
  { 'name' => 'INI', 'source' => 'https://github.com/clintberry/sublime-text-2-ini' },
  { 'name' => 'JS2Coffee', 'source' => 'https://github.com/nibblebot/sublime-js2coffee' },
  { 'name' => 'Markdown Preview', 'source' => 'https://github.com/revolunet/sublimetext-markdown-preview' },
  { 'name' => 'Pretty JSON', 'source' => 'https://github.com/dzhibas/SublimePrettyJson' },
  { 'name' => 'RSpec', 'source' => 'https://github.com/SublimeText/RSpec' },
  { 'name' => 'RubyHashConverter', 'source' => 'https://github.com/iltempo/sublime-text-2-hash-syntax' },
  { 'name' => 'RubyMotionBuilder', 'source' => 'https://github.com/RubyMotionJP/SublimeRubyMotionBuilder' },
  { 'name' => 'RubyTest', 'source' => 'https://github.com/maltize/sublime-text-2-ruby-tests' },
  { 'name' => 'Sass', 'source' => 'https://github.com/nathos/sass-textmate-bundle' },
  { 'name' => 'SCSS', 'source' => 'https://github.com/kuroir/SCSS.tmbundle' },
  { 'name' => 'sublime_text_alternative_autocompletion', 'source' => 'https://github.com/alexstaubo/sublime_text_alternative_autocompletion' },
  { 'name' => 'SublimeLinter', 'source' => 'https://github.com/SublimeLinter/SublimeLinter3' },
  { 'name' => 'SublimeLinter-haml-lint', 'source' => 'https://github.com/jeroenj/SublimeLinter-contrib-haml-lint' },
  { 'name' => 'SublimeLinter-rubocop', 'source' => 'https://github.com/SublimeLinter/SublimeLinter-rubocop' },
  { 'name' => 'Toggle Symbol to String', 'source' => 'https://github.com/zoomix/SublimeToggleSymbol' },
  { 'name' => 'ToggleQuotes', 'source' => 'https://github.com/spadgos/sublime-ToggleQuotes' }
]
default[:elephant][:sublime_text][:settings] = {
  'FileDiffs' => {
    'cmd' => %w[opendiff $file1 $file2]
  },
  'Git' => {
    'statusbar_branch' => false,
    'statusbar_status' => false
  },
  'RubyTest' => {
    'run_rspec_command' => 'if [ -e bin/rspec ]; then bin/rspec {relative_path}; elif [ -e Gemfile ]; then bundle exec rspec {relative_path}; else rspec {relative_path}; fi',
    'run_single_rspec_command' => 'if [ -e bin/rspec ]; then bin/rspec {relative_path}:{line_number}; elif [ -e Gemfile ]; then bundle exec rspec {relative_path}:{line_number}; else rspec {relative_path}:{line_number}; fi'
  },
  'Package Control' => {
    'auto_upgrade' => false,
    'install_missing' => false
  },
  'Preferences' => {
    'auto_complete_delay' => 500,
    'binary_file_patterns' => %w(*.dds *.eot *.gif *.ico *.jar *.jpeg *.jpg *.pdf *.png *.swf *.tga *.ttf *.zip),
    'detect_indentation' => false,
    'ensure_newline_at_eof_on_save' => true,
    'file_exclude_patterns' => %w(*.a *.class *.db *.dll *.dylib *.exe *.idb *.lib *.ncb *.o *.obj *.pdb *.psd *.pyc *.pyo *.sdf *.so *.suo .DS_Store),
    'folder_exclude_patterns' => %w(.svn .git .hg CVS .sass-cache tmp log),
    'font_size' => 11.0,
    'highlight_line' => true,
    'highlight_modified_tabs' => true,
    'hot_exit' => false,
    'ignored_packages' => %w(Vintage),
    'margin' => 4,
    'match_brackets_angle' => true,
    'remember_open_files' => false,
    'scroll_past_end' => true,
    'tab_size' => 2,
    'translate_tabs_to_spaces' => true,
    'trim_trailing_white_space_on_save' => true,
    'word_wrap' => false
  },
  'SublimeLinter' => {
    'user' => {
      'linters' => {
        'rubocop' => {
          '@disable' => false,
          'args' => [],
          'excludes' => []
        }
      },
      'mark_style' => 'stippled underline'
    }
  }
}
