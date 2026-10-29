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

package org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{genericProfileAction} = undef;
    $self->{genericProfileActionScriptJPanel} = undef;
    $self->{blankProfileActionScriptJPanel} = undef;
    $self->{genericProfileActionScriptJScrollPane} = undef;
    $self->{ifJLabel} = undef;
    $self->{newAlwaysJButton} = undef;
    $self->{newColorAtJButton} = undef;
    $self->{newTimeIntervalJButton} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->initComponents();
    return $self;
}


sub updateProfileActionUI {
    my ($self) = @_;
        $self->{blankProfileActionScriptJPanel}->removeAll();
        my $genericProfileActionScriptJPanel = 'org::allbinary::input::automation::module::generic::configuration::profile::actions::script::GenericProfileActionScriptJPanel'->new();
        'org::allbinary::input::automation::actions::script::JTreeInterfaceFactory'->getInstance()->set($genericProfileActionScriptJPanel);
        $self->setGenericProfileActionScriptJPanel($genericProfileActionScriptJPanel);
        $self->getGenericProfileActionScriptJPanel()->setGenericProfileActionScript($self->getGenericProfileAction()->getGenericProfileActionScript());
        $self->getGenericProfileActionScriptJPanel()->updateJTree();
        my $layout = $self->{blankProfileActionScriptJPanel}->getLayout();
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 395, 32767)->addComponent($self->getGenericProfileActionScriptJPanel(), $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 256, 32767)->addComponent($self->getGenericProfileActionScriptJPanel(), $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}));
        $self->{logUtil}->putF("Updated UI", $self, "updateUI");
}


sub getGenericProfileAction {
    my ($self) = @_;
        return $self->{genericProfileAction};
}


sub setGenericProfileAction {
    my ($self, $genericProfileAction) = @_;
        $self->{genericProfileAction} = $genericProfileAction;
}


sub getGenericProfileActionScriptJPanel {
    my ($self) = @_;
        return $self->{genericProfileActionScriptJPanel};
}


sub setGenericProfileActionScriptJPanel {
    my ($self, $genericProfileActionScriptJPanel) = @_;
        $self->{genericProfileActionScriptJPanel} = $genericProfileActionScriptJPanel;
}


sub initComponents {
    my ($self) = @_;
        $self->{genericProfileActionScriptJScrollPane} = 'javax::swing::JScrollPane'->new();
        $self->{blankProfileActionScriptJPanel} = 'javax::swing::JPanel'->new();
        $self->{ifJLabel} = 'javax::swing::JLabel'->new();
        $self->{newColorAtJButton} = 'javax::swing::JButton'->new();
        $self->{newTimeIntervalJButton} = 'javax::swing::JButton'->new();
        $self->{newAlwaysJButton} = 'javax::swing::JButton'->new();
        $self->setMinimumSize('java::awt::Dimension'->new(440, 275));
        $self->setPreferredSize('java::awt::Dimension'->new(440, 275));
        $self->{genericProfileActionScriptJScrollPane}->setPreferredSize('java::awt::Dimension'->new(474, 270));
        $self->{blankProfileActionScriptJPanel}->setMinimumSize('java::awt::Dimension'->new(400, 200));
        my $blankProfileActionScriptJPanelLayout = 'javax::swing::GroupLayout'->new($self->{blankProfileActionScriptJPanel});
        $self->{blankProfileActionScriptJPanel}->setLayout($blankProfileActionScriptJPanelLayout);
        $blankProfileActionScriptJPanelLayout->setHorizontalGroup($blankProfileActionScriptJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 9996, 32767));
        $blankProfileActionScriptJPanelLayout->setVerticalGroup($blankProfileActionScriptJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 9967, 32767));
        $self->{genericProfileActionScriptJScrollPane}->setViewportView($self->{blankProfileActionScriptJPanel});
        $self->{ifJLabel}->setText("Conditions:");
        $self->{newColorAtJButton}->setText("Color Range At");
        $self->{newColorAtJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68172 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->newColorAtJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68172'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68172'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68172')
        });
        $self->{newTimeIntervalJButton}->setText("Time Interval");
        $self->{newTimeIntervalJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68359 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->newTimeIntervalJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68359'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68359'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68359')
        });
        $self->{newAlwaysJButton}->setText("Always On/Off");
        $self->{newAlwaysJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68546 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->newAlwaysJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68546'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68546'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68546')
        });
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{ifJLabel})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{newColorAtJButton})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{newTimeIntervalJButton})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{newAlwaysJButton})->addContainerGap(61, 32767))->addComponent($self->{genericProfileActionScriptJScrollPane}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 440, 32767));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addGroup($layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{ifJLabel}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 14, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{newColorAtJButton})->addComponent($self->{newTimeIntervalJButton})->addComponent($self->{newAlwaysJButton}))->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{genericProfileActionScriptJScrollPane}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 246, 32767)));
}


sub newTimeIntervalJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->{logUtil}->putF("New Time Interval Action Condition", $self, "newTimeIntervalJButtonActionPerformed");
        $self->getGenericProfileAction()->getGenericProfileActionScript()->addCondition('org::allbinary::input::automation::actions::script::condition::TimeIntervalActionScriptCondition'->new());
        $self->updateProfileActionUI();
}


sub newAlwaysJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->{logUtil}->putF("New EveryTime Action Condition", $self, "newEveryTimeJButtonActionPerformed");
        $self->getGenericProfileAction()->getGenericProfileActionScript()->addCondition('org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptCondition'->new());
        $self->updateProfileActionUI();
}


sub newColorAtJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->{logUtil}->putF("New Color At Action Condition", $self, "newColorAtJButtonActionPerformed");
        $self->getGenericProfileAction()->getGenericProfileActionScript()->addCondition('org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptCondition'->new());
        $self->updateProfileActionUI();
}

use org::allbinary::input::automation::actions::script::JTreeInterfaceFactory;
use org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptCondition;
use org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptCondition;
use org::allbinary::input::automation::actions::script::condition::ProfileActionScriptConditionInterface;
use org::allbinary::input::automation::actions::script::condition::TimeIntervalActionScriptCondition;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::script::GenericProfileActionScriptJPanel;
use org::allbinary::logic::communication::log::LogUtil;

1;

