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

package org::allbinary::graphics::form::FormTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::form::FormTypeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{UNK} = "Unknown FormType";
    $self->{NULL_FORM_TYPE} = 'org::allbinary::graphics::form::FormType'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{NULL_STRING});
    $self->{TEMP_HORIZONTAL_FORM} = 'org::allbinary::graphics::form::FormType'->new("TempHorizontal");
    $self->{HORIZONTAL_FORM} = 'org::allbinary::graphics::form::FormType'->new("Horizontal");
    $self->{VERTICAL_CENTER_FORM} = 'org::allbinary::graphics::form::FormType'->new("Vertical");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::form::FormTypeFactory::instance;
}


sub getFormType {
    my ($self) = @_;
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        my $formType = undef;
        if ($displayInfo->isPortrait()) {
            $formType = $self->{VERTICAL_CENTER_FORM};
        } else {
            $formType = $self->{HORIZONTAL_FORM};
        }
        return $formType;
}

use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::graphics::form::FormType;

1;

