package SPVM::Digest::MD5;

our $VERSION = "1.001";

1;

=head1 Name

SPVM::Digest::MD5 - MD5

=head1 Description

The Digest::MD5 class of L<SPVM> has methods for MD5.

=head1 Usage

  use Digest::MD5;
  
  my $digest = Digest::MD5->md5($data);
  my $digest = Digest::MD5->md5_hex($data);
  my $digest = Digest::MD5->md5_base64($data);

Object-Oriented Programming:

  my $md5 = Digest::MD5->new;
  
  $md5->add($data1);
  $md5->add($data2);
  
  my $digest = $md5->digest;
  my $digest = $md5->hexdigest;
  my $digest = $md5->b64digest;

=head1 Class Methods

=head2 md5

  static method md5 : string ($data : string);

Calculates the MD5 digest
of the $data, and returns it in binary form.  The returned string
will be 16 bytes long.

Exceptions:

The $data must be defined. Otherwise an exception is thrown.

=head2 md5_hex

  static method md5_hex : string ($data : string);

Same as L</"md5">, but will return the digest in hexadecimal form. The
length of the returned string will be 32 and it will only contain
characters from this set: '0'..'9' and 'a'..'f'.

Exceptions:

Exceptions of L</"md5"> can be thrown.

=head2 md5_base64

  static method md5_base64 : string ($data : string);

Same as L</"md5">, but will return the digest as a base64 encoded string.
The length of the returned string will be 22 and it will only contain
characters from this set: 'A'..'Z', 'a'..'z', '0'..'9', '+' and
'/'.

Note that the base64 encoded string returned is not padded to be a
multiple of 4 bytes long.  If you want interoperability with other
base64 encoded md5 digests you might want to append the redundant
string "==" to the result.

Exceptions:

Exceptions of L</"md5"> can be thrown.

=head2 new

  static method new : Digest::MD5 ();

Returns a new L<Digest::MD5|SPVM::Digest::MD5> object which encapsulate
the state of the MD5 message-digest algorithm.

=head1 Instance Methods

=head2 add

  method add : Digest::MD5 ($data : string);

The $data provided as argument are appended to the message we
calculate the digest for. The return value is the L<Digest::MD5|SPVM::Digest::MD5> object itself.

Exceptions:

The $data must be defined. Otherwise an exception is thrown.

Examples:

  $md5->add("abc");
  $md5->add("efg");

=head2 digest

  method digest : string ();

Returns the binary digest for the message.  The returned string will be
16 bytes long.

=head2 hexdigest

  method hexdigest : string ();

Same as L</"digest">, but will return the digest in hexadecimal
form. The length of the returned string will be 32 and it will only
contain characters from this set: '0'..'9' and 'a'..'f'.

=head2 b64digest

  method b64digest : string ();

Same as L</"digest">, but will return the digest as a base64 encoded
string.  The length of the returned string will be 22 and it will only
contain characters from this set: 'A'..'Z', 'a'..'z', '0'..'9', '+'
and '/'.

The base64 encoded string returned is not padded to be a multiple of 4
bytes long.  If you want interoperability with other base64 encoded
md5 digests you might want to append the string "==" to the result.

=head1 Repository

L<SPVM::Digest::MD5 - Github|https://github.com/yuki-kimoto/SPVM-Digest-MD5>

=head1 See Also

=over 2

=item * L<Digest::MD5> - SPVM::Digest::MD5 is a Perl's Digest::MD5 porting to SPVM

=back

=head1 Author

Yuki Kimoto C<kimoto.yuki@gmail.com>

=head1 Contributors

L<Yoshiyuki Itoh|https://github.com/YoshiyukiItoh>

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License
