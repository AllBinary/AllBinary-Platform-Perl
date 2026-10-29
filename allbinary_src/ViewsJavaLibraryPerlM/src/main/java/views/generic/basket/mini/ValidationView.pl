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

package views::generic::basket::mini::ValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::generic::basket::mini::MiniBasketView','org::allbinary::logic::control::validate::ValidationComponentInterface';



sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
        # super(...) made $self above
    return $self;
}


sub isValid {
    my ($self) = @_;
        return 1;
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}


sub validationInfo {
    my ($self) = @_;
        return $org::allbinary::globals::MESSAGES::CONTACTADMIN;
}

use org::allbinary::globals::MESSAGES;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use views::generic::basket::mini::MiniBasketView;

1;

