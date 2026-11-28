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
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{capturedImageActionScriptOutputInterface} = undef unless exists $self->{capturedImageActionScriptOutputInterface};
    $self->{capturedImageActionJButton} = undef unless exists $self->{capturedImageActionJButton};
    $self->{capturedImageActionJDialog} = undef unless exists $self->{capturedImageActionJDialog};
    $self->{displayJCheckBox} = undef unless exists $self->{displayJCheckBox};
    $self->{itemTypesJList} = undef unless exists $self->{itemTypesJList};
    $self->{jLabel1} = undef unless exists $self->{jLabel1};
    $self->{jScrollPane1} = undef unless exists $self->{jScrollPane1};
    $self->{okJButton} = undef unless exists $self->{okJButton};
    $self->{saveJCheckBox} = undef unless exists $self->{saveJCheckBox};
    $self->{titleJLabel} = undef unless exists $self->{titleJLabel};
}


sub new {
    my ($class, $capturedImageActionScriptOutputInterface) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
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
        my $defaultListModel = 'javax::swing::DefaultListModel'->new();
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
            package java::awt::event::ActionListener::AnonymousN68305 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->okJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68305'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68305'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68305')
        });
        $self->{saveJCheckBox}->setText("Save To File");
        $self->{saveJCheckBox}->setBorder('javax::swing::BorderFactory'->createEmptyBorder(0, 0, 0, 0));
        $self->{saveJCheckBox}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{displayJCheckBox}->setText("Display");
        $self->{displayJCheckBox}->setBorder('javax::swing::BorderFactory'->createEmptyBorder(0, 0, 0, 0));
        $self->{displayJCheckBox}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{displayJCheckBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68710 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->displayJCheckBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68710'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68710'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68710')
        });
        $self->{itemTypesJList}->setModel(do {
            package javax::swing::AbstractListModel::AnonymousN68819 { our @ISA = ('javax::swing::AbstractListModel', 'java::lang::Object');
            

            sub getSize {
                my ($self) = @_;
                return scalar(@{$self->{strings}});
            }
            

            sub getElementAt {
                my ($self, $i) = @_;
                return $self->{strings}->[$i];
            }
            sub _init_anonymous_fields {
                my ($self) = @_;
                $self->{strings} = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];
            }
            }
            my $anonymous = 'javax::swing::AbstractListModel::AnonymousN68819'->can('new') ? 'javax::swing::AbstractListModel::AnonymousN68819'->new() : bless({}, 'javax::swing::AbstractListModel::AnonymousN68819'); $anonymous->_init_anonymous_fields(); $anonymous
        });
        $self->{jScrollPane1}->setViewportView($self->{itemTypesJList});
        my $capturedImageActionJDialogLayout = 'javax::swing::GroupLayout'->new($self->{capturedImageActionJDialog}->getContentPane());
        $self->{capturedImageActionJDialog}->getContentPane()->setLayout($capturedImageActionJDialogLayout);
        $capturedImageActionJDialogLayout->setHorizontalGroup($capturedImageActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($capturedImageActionJDialogLayout->createSequentialGroup()->addGroup($capturedImageActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($capturedImageActionJDialogLayout->createSequentialGroup()->addGap(61, 61, 61)->addComponent($self->{titleJLabel}))->addGroup($capturedImageActionJDialogLayout->createSequentialGroup()->addContainerGap()->addGroup($capturedImageActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($capturedImageActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{displayJCheckBox})->addComponent($self->{saveJCheckBox}, $javax::swing::GroupLayout::Alignment->{TRAILING}))->addGroup($capturedImageActionJDialogLayout->createSequentialGroup()->addGap(84, 84, 84)->addComponent($self->{okJButton}))))->addGroup($capturedImageActionJDialogLayout->createSequentialGroup()->addContainerGap()->addComponent($self->{jScrollPane1}, $javax::swing::GroupLayout::DEFAULT_SIZE, 216, 32767)))->addContainerGap()));
        $capturedImageActionJDialogLayout->setVerticalGroup($capturedImageActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($capturedImageActionJDialogLayout->createSequentialGroup()->addComponent($self->{titleJLabel})->addGap(5, 5, 5)->addComponent($self->{jScrollPane1}, $javax::swing::GroupLayout::DEFAULT_SIZE, 105, 32767)->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{saveJCheckBox})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{displayJCheckBox})->addGap(9, 9, 9)->addComponent($self->{okJButton})->addContainerGap()));
        $self->setMinimumSize('java::awt::Dimension'->new(100, 0));
        $self->{capturedImageActionJButton}->setText("Edit");
        $self->{capturedImageActionJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70175 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->capturedImageActionJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70175'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70175'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70175')
        });
        $self->{jLabel1}->setText("Capture Image:");
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jLabel1})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED}, $javax::swing::GroupLayout::DEFAULT_SIZE, 32767)->addComponent($self->{capturedImageActionJButton})));
        $layout->setVerticalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{jLabel1})->addComponent($self->{capturedImageActionJButton})));
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

use java::lang::Object ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();
# use javax::swing::DefaultListModel ();
use org::allbinary::input::media::image::InputImageType ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::string::CommonStrings ();
# use java::awt::Dimension ();
# use java::awt::Insets ();
# use java::awt::event::ActionEvent ();
# use java::awt::event::ActionListener ();
# use javax::swing::AbstractListModel ();
# use javax::swing::BorderFactory ();
# use javax::swing::GroupLayout ();
# use javax::swing::JButton ();
# use javax::swing::JCheckBox ();
# use javax::swing::JDialog ();
# use javax::swing::JLabel ();
# use javax::swing::JList ();
# use javax::swing::JPanel ();
# use javax::swing::JScrollPane ();
# use javax::swing::LayoutStyle ();
use org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageTypes ();

1;

