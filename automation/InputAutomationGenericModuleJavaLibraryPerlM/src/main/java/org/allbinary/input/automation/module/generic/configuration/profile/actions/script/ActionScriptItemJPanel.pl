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

package org::allbinary::input::automation::module::generic::configuration::profile::actions::script::ActionScriptItemJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{childActionScriptConditionJPanel} = undef;
    $self->{newActionScriptConditionJPanel} = undef;
    $self->{newActionScriptInputJPanel} = undef;
    $self->{removeJPanel} = undef;
    $self->{scriptItemJPanel} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->initComponents();
    return $self;
}


sub getNewActionScriptInputJPanel {
    my ($self) = @_;
        return $self->{newActionScriptInputJPanel};
}


sub setNewActionScriptInputJPanel {
    my ($self, $newActionScriptInputJPanel) = @_;
        $self->{newActionScriptInputJPanel} = $newActionScriptInputJPanel;
}


sub getRemoveJPanel {
    my ($self) = @_;
        return $self->{removeJPanel};
}


sub setRemoveJPanel {
    my ($self, $removeJPanel) = @_;
        $self->{removeJPanel} = $removeJPanel;
}


sub getScriptItemJPanel {
    my ($self) = @_;
        return $self->{scriptItemJPanel};
}


sub setScriptItemJPanel {
    my ($self, $scriptItemJPanel) = @_;
        $self->{scriptItemJPanel} = $scriptItemJPanel;
}


sub getNewActionScriptConditionJPanel {
    my ($self) = @_;
        return $self->{newActionScriptConditionJPanel};
}


sub setNewActionScriptConditionJPanel {
    my ($self, $newActionScriptConditionJPanel) = @_;
        $self->{newActionScriptConditionJPanel} = $newActionScriptConditionJPanel;
}


sub getChildActionScriptConditionJPanel {
    my ($self) = @_;
        return $self->{childActionScriptConditionJPanel};
}


sub setChildActionScriptConditionJPanel {
    my ($self, $childActionScriptConditionJPanel) = @_;
        $self->{childActionScriptConditionJPanel} = $childActionScriptConditionJPanel;
}


sub initComponents {
    my ($self) = @_;
        $self->{newActionScriptInputJPanel} = 'javax::swing::JPanel'->new();
        $self->{childActionScriptConditionJPanel} = 'javax::swing::JPanel'->new();
        $self->{newActionScriptConditionJPanel} = 'javax::swing::JPanel'->new();
        $self->{scriptItemJPanel} = 'javax::swing::JPanel'->new();
        $self->{removeJPanel} = 'javax::swing::JPanel'->new();
        $self->{newActionScriptInputJPanel}->setLayout('java::awt::GridLayout'->new(1, 0));
        my $childActionScriptConditionJPanelLayout = 'javax::swing::GroupLayout'->new($self->{childActionScriptConditionJPanel});
        $self->{childActionScriptConditionJPanel}->setLayout($childActionScriptConditionJPanelLayout);
        $childActionScriptConditionJPanelLayout->setHorizontalGroup($childActionScriptConditionJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 229, 32767));
        $childActionScriptConditionJPanelLayout->setVerticalGroup($childActionScriptConditionJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 8, 32767));
        $self->{newActionScriptConditionJPanel}->setLayout('java::awt::GridLayout'->new(1, 0));
        $self->{scriptItemJPanel}->setLayout('java::awt::GridLayout'->new(1, 1));
        $self->{removeJPanel}->setLayout('java::awt::GridLayout'->new(1, 1));
        $self->{removeJPanel}->setMinimumSize('java::awt::Dimension'->new(30, 20));
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{scriptItemJPanel}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 167, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{removeJPanel}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 56, 32767))->addComponent($self->{newActionScriptInputJPanel}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 229, 32767)->addComponent($self->{newActionScriptConditionJPanel}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 229, 32767)->addComponent($self->{childActionScriptConditionJPanel}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addGroup($layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{scriptItemJPanel}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 31, 32767)->addComponent($self->{removeJPanel}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 31, 32767))->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{childActionScriptConditionJPanel}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{newActionScriptConditionJPanel}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 28, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{newActionScriptInputJPanel}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 30, $org::allbinary::input::automation::module::generic::configuration::profile::actions::script::javax::swing->{GroupLayout}->{PREFERRED_SIZE})));
}


1;

