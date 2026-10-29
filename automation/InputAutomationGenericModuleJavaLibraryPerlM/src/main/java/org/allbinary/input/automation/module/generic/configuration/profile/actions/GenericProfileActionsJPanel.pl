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

package org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionsJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{genericProfileActions} = undef;
    $self->{genericProfileActionJPanel} = undef;
    $self->{blankGenericProfileActionJPanel} = undef;
    $self->{deleteActionJButton} = undef;
    $self->{genericProfileActionsJList} = undef;
    $self->{genericProfileActionsJPanel} = undef;
    $self->{genericProfileActionsJScrollPane} = undef;
    $self->{newActionJButton} = undef;
    $self->{newProfileActionJDialog} = undef;
    $self->{newProfileActionJLabel} = undef;
    $self->{newProfileActionJTextField} = undef;
    $self->{okNewProfileActionJButton} = undef;
    $self->{saveJButton} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->initComponents();
    return $self;
}


sub initComponents {
    my ($self) = @_;
        $self->{newProfileActionJDialog} = 'javax::swing::JDialog'->new();
        $self->{newProfileActionJLabel} = 'javax::swing::JLabel'->new();
        $self->{okNewProfileActionJButton} = 'javax::swing::JButton'->new();
        $self->{newProfileActionJTextField} = 'javax::swing::JTextField'->new();
        $self->{genericProfileActionsJPanel} = 'javax::swing::JPanel'->new();
        $self->{genericProfileActionsJScrollPane} = 'javax::swing::JScrollPane'->new();
        $self->{genericProfileActionsJList} = 'javax::swing::JList'->new();
        $self->{newActionJButton} = 'javax::swing::JButton'->new();
        $self->{deleteActionJButton} = 'javax::swing::JButton'->new();
        $self->{saveJButton} = 'javax::swing::JButton'->new();
        $self->{blankGenericProfileActionJPanel} = 'javax::swing::JPanel'->new();
        $self->{newProfileActionJDialog}->setMinimumSize('java::awt::Dimension'->new(250, 150));
        $self->{newProfileActionJDialog}->setResizable(0);
        $self->{newProfileActionJLabel}->setText("New Action Name");
        $self->{okNewProfileActionJButton}->setText("Ok");
        $self->{okNewProfileActionJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN66660 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->okNewProfileActionJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN66660'->can('new') ? 'java::awt::event::ActionListener::AnonymousN66660'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN66660')
        });
        my $newProfileActionJDialogLayout = 'javax::swing::GroupLayout'->new($self->{newProfileActionJDialog}->getContentPane());
        $self->{newProfileActionJDialog}->getContentPane()->setLayout($newProfileActionJDialogLayout);
        $newProfileActionJDialogLayout->setHorizontalGroup($newProfileActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($newProfileActionJDialogLayout->createSequentialGroup()->addGroup($newProfileActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($newProfileActionJDialogLayout->createSequentialGroup()->addGap(93, 93, 93)->addComponent($self->{okNewProfileActionJButton}))->addGroup($newProfileActionJDialogLayout->createSequentialGroup()->addGap(75, 75, 75)->addComponent($self->{newProfileActionJLabel}))->addGroup($newProfileActionJDialogLayout->createSequentialGroup()->addGap(29, 29, 29)->addComponent($self->{newProfileActionJTextField}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 178, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE})))->addContainerGap(34, 32767)));
        $newProfileActionJDialogLayout->setVerticalGroup($newProfileActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $newProfileActionJDialogLayout->createSequentialGroup()->addContainerGap()->addComponent($self->{newProfileActionJLabel})->addGap(21, 21, 21)->addComponent($self->{newProfileActionJTextField}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED}, 20, 32767)->addComponent($self->{okNewProfileActionJButton})->addContainerGap()));
        $self->{genericProfileActionsJPanel}->setPreferredSize('java::awt::Dimension'->new(10000, 10000));
        $self->{genericProfileActionsJList}->addListSelectionListener(do {
            package javax::swing::event::ListSelectionListener::AnonymousN67914 { our @ISA = ('javax::swing::event::ListSelectionListener');
            

            sub valueChanged {
                my ($self, $evt) = @_;
                $self->genericProfileActionsJListValueChanged($evt);
            }
            }
            'javax::swing::event::ListSelectionListener::AnonymousN67914'->can('new') ? 'javax::swing::event::ListSelectionListener::AnonymousN67914'->new() : bless({}, 'javax::swing::event::ListSelectionListener::AnonymousN67914')
        });
        $self->{genericProfileActionsJScrollPane}->setViewportView($self->{genericProfileActionsJList});
        $self->{newActionJButton}->setText("New");
        $self->{newActionJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68138 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->newActionJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68138'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68138'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68138')
        });
        $self->{deleteActionJButton}->setText("Delete");
        $self->{deleteActionJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68325 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->deleteActionJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68325'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68325'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68325')
        });
        $self->{saveJButton}->setText("Save");
        $self->{saveJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68512 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->saveJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68512'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68512'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68512')
        });
        $self->{blankGenericProfileActionJPanel}->setMinimumSize('java::awt::Dimension'->new(500, 300));
        my $blankGenericProfileActionJPanelLayout = 'javax::swing::GroupLayout'->new($self->{blankGenericProfileActionJPanel});
        $self->{blankGenericProfileActionJPanel}->setLayout($blankGenericProfileActionJPanelLayout);
        $blankGenericProfileActionJPanelLayout->setHorizontalGroup($blankGenericProfileActionJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 500, 32767));
        $blankGenericProfileActionJPanelLayout->setVerticalGroup($blankGenericProfileActionJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 296, 32767));
        my $genericProfileActionsJPanelLayout = 'javax::swing::GroupLayout'->new($self->{genericProfileActionsJPanel});
        $self->{genericProfileActionsJPanel}->setLayout($genericProfileActionsJPanelLayout);
        $genericProfileActionsJPanelLayout->setHorizontalGroup($genericProfileActionsJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($genericProfileActionsJPanelLayout->createSequentialGroup()->addComponent($self->{genericProfileActionsJScrollPane}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 95, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{blankGenericProfileActionJPanel}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767))->addGroup($genericProfileActionsJPanelLayout->createSequentialGroup()->addComponent($self->{newActionJButton})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{deleteActionJButton})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{saveJButton})->addContainerGap()));
        $genericProfileActionsJPanelLayout->setVerticalGroup($genericProfileActionsJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($genericProfileActionsJPanelLayout->createSequentialGroup()->addGroup($genericProfileActionsJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{newActionJButton})->addComponent($self->{deleteActionJButton})->addComponent($self->{saveJButton}))->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($genericProfileActionsJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING}, 0)->addComponent($self->{blankGenericProfileActionJPanel}, 0, 296, 32767)->addComponent($self->{genericProfileActionsJScrollPane}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 296, 32767))->addContainerGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)));
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{genericProfileActionsJPanel}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 596, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addContainerGap($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{genericProfileActionsJPanel}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 336, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}));
}


sub setModel {
    my ($self) = @_;
        my $defaultListModelHelper = $self->getGenericProfileActions()->getDefaultListModelHelper();
        if ($defaultListModelHelper->getListModel()->getSize() > 0) {
            $self->{genericProfileActionsJList}->setModel($defaultListModelHelper->getListModel());
        }
}


sub saveJButtonActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->getGenericProfileActions()->save();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "saveJButtonActionPerformed", $e);
        }
}


sub updateProfileActionUI {
    my ($self, $profileActionNameString) = @_;
        $self->{blankGenericProfileActionJPanel}->removeAll();
        if (defined($profileActionNameString)) {
            my $genericProfileAction = $self->getGenericProfileActions()->getAction($profileActionNameString);
            $self->setGenericProfileActionJPanel('org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionJPanel'->new());
            $self->getGenericProfileActionJPanel()->setGenericProfileAction($genericProfileAction);
            $self->getGenericProfileActionJPanel()->updateProfileActionUI();
            my $layout = $self->{blankGenericProfileActionJPanel}->getLayout();
            $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 395, 32767)->addComponent($self->getGenericProfileActionJPanel(), $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}));
            $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 256, 32767)->addComponent($self->getGenericProfileActionJPanel(), $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::module::generic::configuration::profile::actions::javax::swing->{GroupLayout}->{PREFERRED_SIZE}));
            $self->{logUtil}->putF("Setting Configuration Profile Actions JPanel", $self, "genericProfileActionsJListValueChanged");
        }
}


sub genericProfileActionsJListValueChanged {
    my ($self, $evt) = @_;
        try {
            my $profileActionNameString = $self->{genericProfileActionsJList}->getSelectedValue();
            $self->updateProfileActionUI($profileActionNameString);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "genericProfileActionsJListValueChanged", $e);
        }
}


sub okNewProfileActionJButtonActionPerformed {
    my ($self, $evt) = @_;
        try {
            my $newActionName = $self->{newProfileActionJTextField}->getText();
            $self->getGenericProfileActions()->add($newActionName);
            $self->setModel();
            $self->{genericProfileActionsJList}->setSelectedValue($newActionName, 1);
            $self->{newProfileActionJDialog}->setVisible(0);
            $self->updateProfileActionUI($newActionName);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "okNewProfileActionJButtonActionPerformed", $e);
        }
}


sub deleteActionJButtonActionPerformed {
    my ($self, $evt) = @_;
        try {
            my $anyType = $self->{genericProfileActionsJList}->getSelectedValues();
            for (my $index = 0; $index < scalar(@{$anyType}); $index++) {
                my $nextSelectedValueString = $anyType->[$index];
                $self->getGenericProfileActions()->remove($nextSelectedValueString);
            }
            $self->selectFirstElement();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "deleteActionJButtonActionPerformed", $e);
        }
}


# throws Exception
sub selectFirstElement {
    my ($self) = @_;
        $self->setModel();
        if ($self->{genericProfileActionsJList}->getModel()->getSize() > 0) {
            $self->{genericProfileActionsJList}->setSelectedValue($self->{genericProfileActionsJList}->getModel()->getElementAt(0), 1);
            $self->updateProfileActionUI($self->{genericProfileActionsJList}->getModel()->getElementAt(0));
        } else {
            $self->{blankGenericProfileActionJPanel}->removeAll();
            $self->{blankGenericProfileActionJPanel}->repaint();
        }
}


sub getGenericProfileActionJPanel {
    my ($self) = @_;
        return $self->{genericProfileActionJPanel};
}


sub setGenericProfileActionJPanel {
    my ($self, $genericProfileActionJPanel) = @_;
        $self->{genericProfileActionJPanel} = $genericProfileActionJPanel;
}


sub getGenericProfileActions {
    my ($self) = @_;
        return $self->{genericProfileActions};
}


sub setGenericProfileActions {
    my ($self, $genericProfileActions) = @_;
        $self->{genericProfileActions} = $genericProfileActions;
}


sub newActionJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->{newProfileActionJDialog}->setVisible(1);
}

use org::allbinary::input::automation::module::DefaultListModelHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionJPanel;

1;

