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

package org::allbinary::logic::system::loader::SecuredNativeLibraryHelperWrapper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::loader::NativeLibraryHelperWrapper';


sub _init_fields {
    my ($self) = @_;
    $self->{securedNativeLibraryInterface} = undef;
}


sub new {
    my ($class, $securedNativeLibraryInterface) = @_;
    my $self = $class->SUPER::new($securedNativeLibraryInterface->getLibraryName());
    $self->_init_fields();
        # super(...) made $self above
        $self->{securedNativeLibraryInterface} = $securedNativeLibraryInterface;
    return $self;
}


# throws LicensingException
sub unlock {
    my ($self, $abeClientInformation) = @_;
        return $self->{securedNativeLibraryInterface}->unlock('org::allbinary::logic::system::security::AbKeys'->getInstance()->getKey($abeClientInformation, $self->{securedNativeLibraryInterface}->getName()));
}

use org::allbinary::logic::system::security::AbKeys;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::logic::system::loader::NativeLibraryHelperWrapper;

1;

