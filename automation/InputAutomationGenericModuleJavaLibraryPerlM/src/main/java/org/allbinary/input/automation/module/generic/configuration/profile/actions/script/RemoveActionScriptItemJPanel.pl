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

package org::allbinary::input::automation::module::generic::configuration::profile::actions::script::RemoveActionScriptItemJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::awt::Panel';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{genericProfileActionJPanel} = undef;
    $self->{profileActionScriptConditionInterface} = undef;
    $self->{removeJButton} = undef;
}


sub new {
    my ($class, $genericProfileActionJPanel, $profileActionScriptConditionInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->initComponents();
        $self->{genericProfileActionJPanel} = $genericProfileActionJPanel;
        $self->{profileActionScriptConditionInterface} = $profileActionScriptConditionInterface;
    return $self;
}


sub initComponents {
    my ($self) = @_;
        $self->{removeJButton} = 'javax::swing::JButton'->new();
        $self->setLayout('java::awt::GridLayout'->new());
        $self->{removeJButton}->setText("Remove");
        $self->{removeJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN66230 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->removeJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN66230'->can('new') ? 'java::awt::event::ActionListener::AnonymousN66230'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN66230')
        });
        $self->add($self->{removeJButton});
}


sub removeJButtonActionPerformed {
    my ($self, $evt) = @_;
        my $genericProfileAction = $self->{genericProfileActionJPanel}->getGenericProfileAction();
        if (!defined($genericProfileAction)) {
            $self->{logUtil}->putF("GenericProfileAction was null", $self, "removeJButtonActionPerformed");
            return;
        }
        $genericProfileAction->getGenericProfileActionScript()->removeCondition($self->{profileActionScriptConditionInterface});
        $self->{genericProfileActionJPanel}->updateProfileActionUI();
}

use org::allbinary::input::automation::actions::script::condition::ProfileActionScriptConditionInterface;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileAction;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionJPanel;
use org::allbinary::logic::communication::log::LogUtil;

1;

