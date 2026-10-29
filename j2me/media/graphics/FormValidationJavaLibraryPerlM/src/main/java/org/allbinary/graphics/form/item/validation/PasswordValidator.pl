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

package org::allbinary::graphics::form::item::validation::PasswordValidator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::validation::TextFieldItemValidator';



sub new {
    my ($class, $textFieldItem, $min, $max, $allowOnEmpty) = @_;
    my $self = $class->SUPER::new($textFieldItem, $min, $max, $allowOnEmpty);
        # super(...) made $self above
    return $self;
}

use org::allbinary::graphics::form::item::ABTextFieldItem;
use org::allbinary::graphics::form::item::validation::TextFieldItemValidator;

1;

