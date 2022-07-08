package SPVMImplOO;

use strict;
use warnings;

use SPVM 'Digest::MD5';

package Digest::MD5;

use warnings::register;

*Digest::MD5::new = sub {
  my $md5 = SPVM::Digest::MD5->new;
  
  return $md5;
};

*Digest::MD5::add = sub {
  my ($self, @args) = @_;
  
  if ($^W || warnings::enabled()) {
    if (defined $args[0] && $args[0] eq 'Digest::MD5') {
      warn "Digest::MD5::md5 function probably called as class method";
    }
  }
  
  my $data = join('', @args);

  if ($] >= 5.006) {
    utf8::downgrade($data);
  }
  
  my $md5 = SPVM::Digest::MD5->add($data);
  
  return $md5;
};

*Digest::MD5::digest = sub {
  my ($self) = @_;
  
  my $output = $self->digest;
  
  return $output->to_bin;
};

*Digest::MD5::hexdigest = sub {
  my ($self) = @_;
  
  my $output = $self->hexdigest;
  
  return $output->to_bin;
};

*Digest::MD5::b64digest = sub {
  my ($self) = @_;
  
  my $output = $self->b64digest;
  
  return $output->to_bin;
};

*Digest::MD5::is_spvm = sub { 1 };
