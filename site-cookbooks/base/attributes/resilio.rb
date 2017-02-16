default[:base][:resilio][:sync][:ignore] = [
  '# IgnoreList is a UTF-8 encoded .txt file that helps you specify single files, paths and rules',
  '# for ignoring during the synchronization job. It supports "?" and "*" wildcard symbols.',
  '#',
  '#',
  '# OS generated files #',
  '.DS_Store',
  '.Spotlight-V100',
  '.Trashes',
  'ehthumbs.db',
  'desktop.ini',
  'Thumbs.db',
  '# Temporary files #',
  '~*',
  '*~',
  '.~lock.*',
  '*.part',
  '*.crdownload',
  '@eaDir',
  '@SynoResource',
  '.@__thumb',
  '._*',
  '# custom files #'
]

default[:base][:resilio][:sync_directories] = {
  development: {
    path: "#{ENV['HOME']}/Development",
    options: {
      ignore: [
        '*.log',
        'local-mode-cache'
      ]
    }
  }
}
