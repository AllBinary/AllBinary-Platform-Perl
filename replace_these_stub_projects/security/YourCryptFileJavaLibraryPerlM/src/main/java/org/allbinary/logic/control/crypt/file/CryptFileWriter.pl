# Generated Code Do Not Modify

package org::allbinary::logic::control::crypt::file::CryptFileWriter;
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
sub write {
    my ($self, $fileAbPath, $document) = @_;
}

use org::allbinary::logic::io::path::AbPath;
use org::w3c::dom::Document;

1;

