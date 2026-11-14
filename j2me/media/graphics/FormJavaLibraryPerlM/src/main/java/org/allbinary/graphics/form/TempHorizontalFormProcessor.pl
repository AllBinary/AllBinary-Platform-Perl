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

package org::allbinary::graphics::form::TempHorizontalFormProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::canvas::Processor';


sub _init_fields {
    my ($self) = @_;
    $self->{scrollCurrentSelectionForm} = undef;
}


sub new {
    my ($class, $scrollCurrentSelectionForm) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->{scrollCurrentSelectionForm} = $scrollCurrentSelectionForm;
    return $self;
}


# throws Exception
sub process {
    my ($self) = @_;
        $self->{scrollCurrentSelectionForm}->processTempHorizontalForm();
        $self->{scrollCurrentSelectionForm}->{processor} = 'org::allbinary::canvas::Processor'->getInstance();
}

use java::lang::Object ();
use org::allbinary::canvas::Processor ();

1;

