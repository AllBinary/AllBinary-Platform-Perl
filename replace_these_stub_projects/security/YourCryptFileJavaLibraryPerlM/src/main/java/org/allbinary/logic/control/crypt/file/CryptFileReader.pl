# Generated Code Do Not Modify

package org::allbinary::logic::control::crypt::file::CryptFileReader;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class, $decryptedExtension, $encryptedExtension) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub get {
    my ($self, $fileAbPath) = @_;
        return undef;
}


# throws Exception
sub getInputStream {
    my ($self, $fileAbPath) = @_;
        return undef;
}

# use java::io::InputStream;
use org::allbinary::logic::io::path::AbPath;

1;

