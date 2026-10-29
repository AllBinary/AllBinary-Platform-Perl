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

package org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{capturedImageActionScriptOutputInterface} = undef;
    $self->{capturedImageActionJButton} = undef;
    $self->{capturedImageActionJDialog} = undef;
    $self->{displayJCheckBox} = undef;
    $self->{itemTypesJList} = undef;
    $self->{jLabel1} = undef;
    $self->{jScrollPane1} = undef;
    $self->{okJButton} = undef;
    $self->{saveJCheckBox} = undef;
    $self->{titleJLabel} = undef;
}


sub new {
    my ($class, $capturedImageActionScriptOutputInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->initComponents();
        $self->{capturedImageActionScriptOutputInterface} = $capturedImageActionScriptOutputInterface;
        $self->set();
    return $self;
}


sub set {
    my ($self) = @_;
        $self->setImageTypeJlistModel();
        my $imageTypes = $self->{capturedImageActionScriptOutputInterface}->getImageTypes();
        my $vector = $imageTypes->getVector();
        my $selectedArray = [(0) x ($vector->size())];
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $imageType = $vector->get($index);
            $selectedArray->[$index++] = $imageType->getIndex();
        }
        $self->{itemTypesJList}->setSelectedIndices($selectedArray);
        if ($self->{capturedImageActionScriptOutputInterface}->isSaved()) {
            $self->{saveJCheckBox}->setSelected(1);
        }
        if ($self->{capturedImageActionScriptOutputInterface}->isSaved()) {
            $self->{displayJCheckBox}->setSelected(1);
        }
        $self->{capturedImageActionScriptOutputInterface}->log();
}


sub update {
    my ($self) = @_;
        my $anyType = $self->{itemTypesJList}->getSelectedValues();
        my $imageTypes = 'org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageTypes'->valueOf($anyType);
        $self->{capturedImageActionScriptOutputInterface}->setImageTypes($imageTypes);
        if ($self->{saveJCheckBox}->isSelected()) {
            $self->{capturedImageActionScriptOutputInterface}->setSaved(1);
        } else {
            $self->{capturedImageActionScriptOutputInterface}->setSaved(0);
        }
        if ($self->{displayJCheckBox}->isSelected()) {
            $self->{capturedImageActionScriptOutputInterface}->setDisplay(1);
        } else {
            $self->{capturedImageActionScriptOutputInterface}->setDisplay(0);
        }
        $self->{capturedImageActionScriptOutputInterface}->log();
}


sub setImageTypeJlistModel {
    my ($self) = @_;
        my $defaultListModel = 'org::allbinary::input::automation::module::actions::script::condition::processors::output::DefaultListModel'->new();
        my $vector = 'org::allbinary::input::media::image::InputImageType'->getAllAsVector();
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $imageType = $vector->get($index);
            $defaultListModel->addElement($imageType->getName());
        }
        $self->{itemTypesJList}->setModel($defaultListModel);
}


sub getCapturedImageActionJDialog {
    my ($self) = @_;
        return $self->{capturedImageActionJDialog};
}


sub setCapturedImageActionJDialog {
    my ($self, $capturedImageActionJDialog) = @_;
        $self->{capturedImageActionJDialog} = $capturedImageActionJDialog;
}


sub initComponents {
    my ($self) = @_;
        $self->{capturedImageActionJDialog} = 'javax::swing::JDialog'->new();
        $self->{titleJLabel} = 'javax::swing::JLabel'->new();
        $self->{okJButton} = 'javax::swing::JButton'->new();
        $self->{saveJCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{displayJCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{jScrollPane1} = 'javax::swing::JScrollPane'->new();
        $self->{itemTypesJList} = 'javax::swing::JList'->new();
        $self->{capturedImageActionJButton} = 'javax::swing::JButton'->new();
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{capturedImageActionJDialog}->setMinimumSize('java::awt::Dimension'->new(250, 250));
        $self->{titleJLabel}->setText("Image Output Options");
        $self->{okJButton}->setText("OK");
        $self->{okJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68202 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->okJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68202'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68202'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68202')
        });
        $self->{saveJCheckBox}->setText("Save To File");
        $self->{saveJCheckBox}->setBorder($org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{BorderFactory}->createEmptyBorder(0, 0, 0, 0));
        $self->{saveJCheckBox}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{displayJCheckBox}->setText("Display");
        $self->{displayJCheckBox}->setBorder($org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{BorderFactory}->createEmptyBorder(0, 0, 0, 0));
        $self->{displayJCheckBox}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{displayJCheckBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68719 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->displayJCheckBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68719'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68719'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68719')
        });
        $self->{itemTypesJList}->setModel(do {
            package javax::swing::AbstractListModel::AnonymousN68876 { our @ISA = ('javax::swing::AbstractListModel');
            $self->{strings} = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];
            

            sub getSize {
                my ($self) = @_;
                return scalar(@{$strings});
            }
            

            sub getElementAt {
                my ($self, $i) = @_;
                return $strings->[$i];
            }
            }
            'javax::swing::AbstractListModel::AnonymousN68876'->can('new') ? 'javax::swing::AbstractListModel::AnonymousN68876'->new() : bless({}, 'javax::swing::AbstractListModel::AnonymousN68876')
        });
        $self->{jScrollPane1}->setViewportView($self->{itemTypesJList});
        my $capturedImageActionJDialogLayout = 'javax::swing::GroupLayout'->new($self->{capturedImageActionJDialog}->getContentPane());
        $self->{capturedImageActionJDialog}->getContentPane()->setLayout($capturedImageActionJDialogLayout);
        $capturedImageActionJDialogLayout->setHorizontalGroup($capturedImageActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($capturedImageActionJDialogLayout->createSequentialGroup()->addGroup($capturedImageActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($capturedImageActionJDialogLayout->createSequentialGroup()->addGap(61, 61, 61)->addComponent($self->{titleJLabel}))->addGroup($capturedImageActionJDialogLayout->createSequentialGroup()->addContainerGap()->addGroup($capturedImageActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($capturedImageActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{displayJCheckBox})->addComponent($self->{saveJCheckBox}, $org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}))->addGroup($capturedImageActionJDialogLayout->createSequentialGroup()->addGap(84, 84, 84)->addComponent($self->{okJButton}))))->addGroup($capturedImageActionJDialogLayout->createSequentialGroup()->addContainerGap()->addComponent($self->{jScrollPane1}, $org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 216, 32767)))->addContainerGap()));
        $capturedImageActionJDialogLayout->setVerticalGroup($capturedImageActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($capturedImageActionJDialogLayout->createSequentialGroup()->addComponent($self->{titleJLabel})->addGap(5, 5, 5)->addComponent($self->{jScrollPane1}, $org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 105, 32767)->addPreferredGap($org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{saveJCheckBox})->addPreferredGap($org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{displayJCheckBox})->addGap(9, 9, 9)->addComponent($self->{okJButton})->addContainerGap()));
        $self->setMinimumSize('java::awt::Dimension'->new(100, 0));
        $self->{capturedImageActionJButton}->setText("Edit");
        $self->{capturedImageActionJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70456 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->capturedImageActionJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70456'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70456'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70456')
        });
        $self->{jLabel1}->setText("Capture Image:");
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jLabel1})->addPreferredGap($org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED}, $org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addComponent($self->{capturedImageActionJButton})));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createParallelGroup($org::allbinary::input::automation::module::actions::script::condition::processors::output::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel1})->addComponent($self->{capturedImageActionJButton})));
}


sub displayJCheckBoxActionPerformed {
    my ($self, $evt) = @_;
}


sub okJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->update();
        $self->getCapturedImageActionJDialog()->setVisible(0);
}


sub capturedImageActionJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->getCapturedImageActionJDialog()->setVisible(1);
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::swing;
use org::allbinary::input::media::image::InputImageType;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageTypes;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::DefaultListModel;

1;

