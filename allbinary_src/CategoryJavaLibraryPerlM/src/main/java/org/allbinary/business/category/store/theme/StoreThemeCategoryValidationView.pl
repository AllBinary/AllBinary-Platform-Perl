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

package org::allbinary::business::category::store::theme::StoreThemeCategoryValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::store::theme::StoreThemeCategoryView','org::allbinary::logic::control::validate::ValidationInterface';



sub new {
    my ($class, $categoryInterface) = @_;
    my $self = $class->SUPER::new($categoryInterface);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub isValid {
    my ($self) = @_;
        return 1;
}


# throws Exception
sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


# throws Exception
sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}


# throws Exception
sub validationInfo {
    my ($self) = @_;
        return "Error";
}

use org::allbinary::logic::control::validate::ValidationInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::category::store::theme::StoreThemeCategoryView;

1;

