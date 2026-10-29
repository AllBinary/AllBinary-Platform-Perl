# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::logic::control::validate::Validation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::validate::ValidationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub isValid {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub toValidationInfoNode {
    my ($self, $document) = @_;
        die ("RuntimeException");
}


# throws Exception
sub toValidationInfoDoc {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub validationInfo {
    my ($self) = @_;
        die ("RuntimeException");
}

use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::control::validate::ValidationInterface;

1;

