#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::system::security::licensing::StoreAppClientInformation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::security::licensing::AbeClientInformation','org::allbinary::thirdparty::store::LongArrayIdentifierInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{longArrayIdentifier} = undef;
}


sub new {
    my ($class, $name, $version, $specialName, $shortName, $longArrayIdentifier) = @_;
    my $self = $class->SUPER::new($name, $version, $specialName, $shortName);
    $self->_init_fields();
        # super(...) made $self above
        $self->{longArrayIdentifier} = $longArrayIdentifier;
    return $self;
}


sub getLongArrayIdentifier {
    my ($self) = @_;
        return $self->{longArrayIdentifier};
}

use org::allbinary::thirdparty::store::LongArrayIdentifierInterface;
use org::allbinary::logic::system::security::licensing::AbeClientInformation;

1;

