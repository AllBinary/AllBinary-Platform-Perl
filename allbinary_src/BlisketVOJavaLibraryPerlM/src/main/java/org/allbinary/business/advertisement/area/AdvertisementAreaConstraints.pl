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

package org::allbinary::business::advertisement::area::AdvertisementAreaConstraints;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::advertisement::area::AdvertisementAreaConstraintsInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{displayInBrowserContraintsInterface} = undef;
    $self->{twoDimensionConstraintsInterface} = undef;
}


sub new {
    my ($class, $document) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $node = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::business::advertisement::area::AdvertisementAreaData'->getInstance()->{NAME}, $document->getChildNodes());
        $self->{displayInBrowserContraintsInterface} = 'org::allbinary::logic::control::contraints::display::browser::DisplayInBrowserContraints'->new($node);
        $self->{twoDimensionConstraintsInterface} = 'org::allbinary::logic::control::contraints::size::TwoDimensionalConstraint'->new($node);
    return $self;
}


sub setDisplayInBrowserContraints {
    my ($self, $displayInBrowserContraintsInterface) = @_;
        $self->{displayInBrowserContraintsInterface} = $displayInBrowserContraintsInterface;
}


sub getTwoDimensionContraints {
    my ($self, $twoDimensionConstraintsInterface) = @_;
        $self->{twoDimensionConstraintsInterface} = $twoDimensionConstraintsInterface;
}


sub getDisplayInBrowserContraints {
    my ($self) = @_;
        return $self->{displayInBrowserContraintsInterface};
}


# Java overloaded method: Perl keeps the last definition
sub getTwoDimensionContraints {
    my ($self) = @_;
        return $self->{twoDimensionConstraintsInterface};
}

use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::logic::control::contraints::display::browser::DisplayInBrowserContraints;
use org::allbinary::logic::control::contraints::display::browser::DisplayInBrowserContraintsInterface;
use org::allbinary::logic::control::contraints::size::TwoDimensionalConstraint;
use org::allbinary::logic::control::contraints::size::TwoDimensionalConstraintInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::advertisement::area::AdvertisementAreaConstraintsInterface;
use org::allbinary::business::advertisement::area::AdvertisementAreaData;

1;

