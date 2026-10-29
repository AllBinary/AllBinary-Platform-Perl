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

package org::allbinary::input::automation::module::game::test::TestModuleFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::AbstractInputAutomationFactory';

our $NAME = "Test New Game" . $org::allbinary::input::automation::module::InputAutomationModuleData::MODULE_NAME_END;

sub _init_fields {
    my ($self) = @_;
    $self->{blankModuleConfigurationJPanel} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new($NAME, 'org::allbinary::input::automation::module::configuration::BlankModuleConfigurationJPanel'->new());
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getName {
    my ($self) = @_;
        return $org::allbinary::input::automation::module::game::test::TestModuleFactory::NAME;
}


sub getConfigurationJPanel {
    my ($self) = @_;
        return $self->{blankModuleConfigurationJPanel};
}


# throws Exception
sub getInstance {
    my ($self) = @_;
        return undef;
}

# use javax::swing;
use org::allbinary::input::automation::module::AbstractInputAutomationFactory;
use org::allbinary::input::automation::module::InputAutomationModuleData;
use org::allbinary::input::automation::module::configuration::BlankModuleConfigurationJPanel;
use org::allbinary::thread::RunnableInterface;

1;

