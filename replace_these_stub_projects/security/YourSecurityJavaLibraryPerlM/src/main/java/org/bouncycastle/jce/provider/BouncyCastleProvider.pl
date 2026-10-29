# Generated Code Do Not Modify

package org::bouncycastle::jce::provider::BouncyCastleProvider;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::security::Provider';

our $info = "BouncyCastle Security Provider v1.41";
our $PROVIDER_NAME = "BC";


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new($org::bouncycastle::jce::provider::BouncyCastleProvider::PROVIDER_NAME, 1.41, $org::bouncycastle::jce::provider::BouncyCastleProvider::info);
        # super(...) made $self above
    return $self;
}


sub setParameter {
    my ($self, $parameterName, $parameter) = @_;
}

# use java::security::Provider;

1;

