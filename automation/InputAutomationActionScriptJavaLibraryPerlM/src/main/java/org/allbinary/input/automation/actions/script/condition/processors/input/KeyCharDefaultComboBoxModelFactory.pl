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

package org::allbinary::input::automation::actions::script::condition::processors::input::KeyCharDefaultComboBoxModelFactory;
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
            my $nextKey = $keyArray->[$index];
            my $keyStroke = 'org::allbinary::input::automation::actions::script::condition::processors::input::KeyStroke'->getKeyStroke(int($nextKey), 0);
            my $keyChar = 'abbot::tester::KeyStrokeMap'->getChar($keyStroke);
            $defaultComboBoxModel->addElement(("" . ($keyChar)));
        }
        return $defaultComboBoxModel;
}

# use javax::swing;
use abbot::tester::KeyStrokeMap;
use org::allbinary::input::KeySingletonFactory;
use org::allbinary::input::automation::actions::script::condition::processors::input::DefaultComboBoxModel;
use org::allbinary::input::automation::actions::script::condition::processors::input::KeyStroke;

1;

