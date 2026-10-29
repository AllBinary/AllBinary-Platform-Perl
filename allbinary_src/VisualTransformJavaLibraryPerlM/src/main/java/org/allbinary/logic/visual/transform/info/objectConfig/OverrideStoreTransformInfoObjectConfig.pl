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

package org::allbinary::logic::visual::transform::info::objectConfig::OverrideStoreTransformInfoObjectConfig;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::objectConfig::GenericStoreTransformInfoObjectConfig';


sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    return $class->_new4(@arguments) if scalar(@arguments) == 4;
    die "No constructor of OverrideStoreTransformInfoObjectConfig takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $abeClientInformation, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($abeClientInformation, $transformInfoInterface);
        # super(...) made $self above
    return $self;
}


sub _new3 {
    my ($class, $abeClientInformation, $transformInfoInterface, $document) = @_;
    my $self = $class->SUPER::new($abeClientInformation, $transformInfoInterface, $document);
        # super(...) made $self above
        $self->setDocument($self->generate($self->toXmlDoc()));
    return $self;
}


sub _new4 {
    my ($class, $abeClientInformation, $transformInfoInterface, $name, $type) = @_;
    my $self = $class->SUPER::new($abeClientInformation, $transformInfoInterface, $name, $type);
        # super(...) made $self above
        $self->setDocument($self->generate($self->toXmlDoc()));
    return $self;
}


# throws Exception
sub generate {
    my ($self, $objectConfigDocument) = @_;
        my $newObjectConfigDocument = $self->SUPER::generate($objectConfigDocument);
        return $newObjectConfigDocument;
}

use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::allbinary::logic::visual::transform::info::objectConfig::GenericStoreTransformInfoObjectConfig;

1;

