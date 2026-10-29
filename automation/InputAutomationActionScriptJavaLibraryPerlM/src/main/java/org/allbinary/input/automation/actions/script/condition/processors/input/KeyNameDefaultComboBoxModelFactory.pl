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

package org::allbinary::input::automation::actions::script::condition::processors::input::KeyNameDefaultComboBoxModelFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        my $defaultComboBoxModel = 'org::allbinary::input::automation::actions::script::condition::processors::input::DefaultComboBoxModel'->new();
        my $keyArray = 'org::allbinary::input::KeySingletonFactory'->getArray();
        for (my $index = 0; $index < scalar(@{$keyArray}); $index++) {
            my $keyAsString = 'java::awt::event::KeyEvent'->getKeyText($keyArray->[$index]);
            $defaultComboBoxModel->addElement($keyAsString);
        }
        return $defaultComboBoxModel;
}

# use java::awt::event::KeyEvent;
# use javax::swing;
use org::allbinary::input::KeySingletonFactory;
use org::allbinary::input::automation::actions::script::condition::processors::input::DefaultComboBoxModel;

1;

