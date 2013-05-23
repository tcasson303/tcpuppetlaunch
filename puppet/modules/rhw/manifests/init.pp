# rhw.pp

class rhw (
  $docroot = '/opt/rhw',
  $gitrepo = 'git@github.com:tcasson303/rails_hello.git'
) {

  # Deploy the app straight from Git into the docroot

  file {
    $docroot:
      ensure  => directory,
      mode    => 0755,
      notify  => Exec[ 'rhw_git_checkout' ];
  }


  # Git checkout command

  exec {
    'rhw_git_checkout':
       cwd         => $docroot,
       command     => "git clone $gitrepo .",
       creates     => "$docroot/.git",
       refreshonly => true;
    }
}
