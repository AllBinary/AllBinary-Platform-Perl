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

package org::allbinary::game::input::PCGameKey;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::Input';



sub new {
    my ($class, $keyCode, $name) = @_;
    my $self = $class->SUPER::new($keyCode, $name);
        # super(...) made $self above
        my $id = $self->getId();
        if ($id >= 0) {
            'org::allbinary::game::input::InputFactory'->getInstance()->add($id, $self);
        }
    return $self;
}


sub toString {
    my ($self) = @_;
        return "PCGameKey: " . $self->SUPER::toString();
}


sub getString {
    my ($class, $keyCode) = @_;
        my $input = 'org::allbinary::game::input::InputFactory'->getInstance()->getInstanceById($keyCode);
        if (defined($input)) {
            return $input->getName();
        } else {
            return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        }
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::game::input::Input;
use org::allbinary::game::input::InputFactory;

1;

