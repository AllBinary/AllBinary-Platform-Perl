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

package org::allbinary::input::automation::module::generic::configuration::GenericModuleConfigurationJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel','org::allbinary::input::automation::module::generic::configuration::GenericModuleConfigurationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{genericProfiles} = undef;
    $self->{selectedGenericProfile} = undef;
    $self->{blankGenericProfileActionsJPanel} = undef;
    $self->{buttonGroup2} = undef;
    $self->{captureComparisonJCheckBox} = undef;
    $self->{captureMotionAnalysisJCheckBox} = undef;
    $self->{deleteProfileJButton} = undef;
    $self->{genericJTabbedPane} = undef;
    $self->{genericProfilesJList} = undef;
    $self->{genericProfilesJPanel} = undef;
    $self->{genericProfilesJScrollPane} = undef;
    $self->{jLabel1} = undef;
    $self->{jLabel2} = undef;
    $self->{jLabel3} = undef;
    $self->{jPanel1} = undef;
    $self->{newProfileJButton} = undef;
    $self->{newProfileJDialog} = undef;
    $self->{newProfileNameJLabel} = undef;
    $self->{newProfileNameJTextField} = undef;
    $self->{okNewProfileJButton} = undef;
    $self->{savedCaptureJRadioButton} = undef;
    $self->{screenCaptureJRadioButton} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->initComponents();
        $self->setGenericProfiles('org::allbinary::input::automation::module::generic::configuration::profile::GenericProfiles'->new($org::allbinary::input::automation::module::generic::configuration::profile::GenericProfiles::DEFAULT_FILE));
        $self->selectFirstElement();
    return $self;
}


sub initComponents {
    my ($self) = @_;
        $self->{newProfileJDialog} = 'javax::swing::JDialog'->new();
        $self->{okNewProfileJButton} = 'javax::swing::JButton'->new();
        $self->{newProfileNameJLabel} = 'javax::swing::JLabel'->new();
        $self->{newProfileNameJTextField} = 'javax::swing::JTextField'->new();
        $self->{buttonGroup2} = 'javax::swing::ButtonGroup'->new();
        $self->{genericJTabbedPane} = 'javax::swing::JTabbedPane'->new();
        $self->{genericProfilesJPanel} = 'javax::swing::JPanel'->new();
        $self->{genericProfilesJScrollPane} = 'javax::swing::JScrollPane'->new();
        $self->{genericProfilesJList} = 'javax::swing::JList'->new();
        $self->{newProfileJButton} = 'javax::swing::JButton'->new();
        $self->{deleteProfileJButton} = 'javax::swing::JButton'->new();
        $self->{jPanel1} = 'javax::swing::JPanel'->new();
        $self->{screenCaptureJRadioButton} = 'javax::swing::JRadioButton'->new();
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{jLabel2} = 'javax::swing::JLabel'->new();
        $self->{savedCaptureJRadioButton} = 'javax::swing::JRadioButton'->new();
        $self->{captureMotionAnalysisJCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{captureComparisonJCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{jLabel3} = 'javax::swing::JLabel'->new();
        $self->{blankGenericProfileActionsJPanel} = 'javax::swing::JPanel'->new();
        $self->{newProfileJDialog}->setMinimumSize('java::awt::Dimension'->new(250, 150));
        $self->{newProfileJDialog}->setResizable(0);
        $self->{okNewProfileJButton}->setText("Ok");
        $self->{okNewProfileJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN67478 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->okNewProfileJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN67478'->can('new') ? 'java::awt::event::ActionListener::AnonymousN67478'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN67478')
        });
        $self->{newProfileNameJLabel}->setText("New Profile Name");
        my $newProfileJDialogLayout = 'javax::swing::GroupLayout'->new($self->{newProfileJDialog}->getContentPane());
        $self->{newProfileJDialog}->getContentPane()->setLayout($newProfileJDialogLayout);
        $newProfileJDialogLayout->setHorizontalGroup($newProfileJDialogLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($newProfileJDialogLayout->createSequentialGroup()->addGroup($newProfileJDialogLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($newProfileJDialogLayout->createSequentialGroup()->addGap(80, 80, 80)->addComponent($self->{newProfileNameJLabel}))->addGroup($newProfileJDialogLayout->createSequentialGroup()->addGap(30, 30, 30)->addComponent($self->{newProfileNameJTextField}, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 180, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addGroup($newProfileJDialogLayout->createSequentialGroup()->addGap(100, 100, 100)->addComponent($self->{okNewProfileJButton})))->addContainerGap(35, 32767)));
        $newProfileJDialogLayout->setVerticalGroup($newProfileJDialogLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($newProfileJDialogLayout->createSequentialGroup()->addGap(10, 10, 10)->addComponent($self->{newProfileNameJLabel})->addGap(16, 16, 16)->addComponent($self->{newProfileNameJTextField}, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addGap(20, 20, 20)->addComponent($self->{okNewProfileJButton})));
        $self->setLayout('java::awt::GridLayout'->new(1, 0));
        $self->setMinimumSize('java::awt::Dimension'->new(400, 300));
        $self->setPreferredSize('java::awt::Dimension'->new(700, 700));
        $self->{genericJTabbedPane}->setToolTipText($self->{stringUtil}->{EMPTY_STRING});
        $self->{genericJTabbedPane}->setMinimumSize('java::awt::Dimension'->new(800, 600));
        $self->{genericProfilesJPanel}->setMinimumSize('java::awt::Dimension'->new(400, 300));
        $self->{genericProfilesJPanel}->setPreferredSize('java::awt::Dimension'->new(0, 0));
        $self->{genericProfilesJList}->addListSelectionListener(do {
            package javax::swing::event::ListSelectionListener::AnonymousN69018 { our @ISA = ('javax::swing::event::ListSelectionListener');
            

            sub valueChanged {
                my ($self, $evt) = @_;
                $self->genericProfilesJListValueChanged($evt);
            }
            }
            'javax::swing::event::ListSelectionListener::AnonymousN69018'->can('new') ? 'javax::swing::event::ListSelectionListener::AnonymousN69018'->new() : bless({}, 'javax::swing::event::ListSelectionListener::AnonymousN69018')
        });
        $self->{genericProfilesJScrollPane}->setViewportView($self->{genericProfilesJList});
        $self->{newProfileJButton}->setText("New");
        $self->{newProfileJButton}->setToolTipText("Creates a new profile");
        $self->{newProfileJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69272 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->newProfileJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69272'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69272'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69272')
        });
        $self->{deleteProfileJButton}->setText("Delete");
        $self->{deleteProfileJButton}->setToolTipText("Deletes the selected profile");
        $self->{deleteProfileJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69489 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->deleteProfileJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69489'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69489'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69489')
        });
        $self->{jPanel1}->setPreferredSize('java::awt::Dimension'->new(1000, 100));
        $self->{screenCaptureJRadioButton}->setText("Screen Captures");
        $self->{screenCaptureJRadioButton}->setToolTipText("Records the screen into memory for logical processing");
        $self->{screenCaptureJRadioButton}->setBorder($org::allbinary::input::automation::module::generic::configuration::javax::swing->{BorderFactory}->createEmptyBorder(0, 0, 0, 0));
        $self->{screenCaptureJRadioButton}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{screenCaptureJRadioButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69921 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->screenCaptureJRadioButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69921'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69921'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69921')
        });
        $self->{jLabel1}->setText("Profile Options");
        $self->{jLabel2}->setText("Process From:");
        $self->{savedCaptureJRadioButton}->setText("Saved Images");
        $self->{savedCaptureJRadioButton}->setToolTipText("Loads images from files for logical processing.  Usually for debugging your profile actions");
        $self->{savedCaptureJRadioButton}->setBorder($org::allbinary::input::automation::module::generic::configuration::javax::swing->{BorderFactory}->createEmptyBorder(0, 0, 0, 0));
        $self->{savedCaptureJRadioButton}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{savedCaptureJRadioButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70348 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->savedCaptureJRadioButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70348'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70348'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70348')
        });
        $self->{captureMotionAnalysisJCheckBox}->setText("Motion Analysis");
        $self->{captureMotionAnalysisJCheckBox}->setToolTipText("Uses image comparison and contraints to locate moving objects");
        $self->{captureMotionAnalysisJCheckBox}->setBorder($org::allbinary::input::automation::module::generic::configuration::javax::swing->{BorderFactory}->createEmptyBorder(0, 0, 0, 0));
        $self->{captureMotionAnalysisJCheckBox}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{captureMotionAnalysisJCheckBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70715 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->captureMotionAnalysisJCheckBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70715'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70715'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70715')
        });
        $self->{captureComparisonJCheckBox}->setText("Comparison");
        $self->{captureComparisonJCheckBox}->setToolTipText("Compares the last two input images for multi image logic");
        $self->{captureComparisonJCheckBox}->setBorder($org::allbinary::input::automation::module::generic::configuration::javax::swing->{BorderFactory}->createEmptyBorder(0, 0, 0, 0));
        $self->{captureComparisonJCheckBox}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{captureComparisonJCheckBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71082 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->captureComparisonJCheckBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71082'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71082'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71082')
        });
        $self->{jLabel3}->setText("Image Processing:");
        $self->{jLabel3}->setToolTipText("Turns on/off various extended image processing");
        my $jPanel1Layout = 'javax::swing::GroupLayout'->new($self->{jPanel1});
        $self->{jPanel1}->setLayout($jPanel1Layout);
        $jPanel1Layout->setHorizontalGroup($jPanel1Layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($jPanel1Layout->createSequentialGroup()->addGroup($jPanel1Layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{screenCaptureJRadioButton})->addComponent($self->{jLabel1})->addComponent($self->{jLabel2})->addComponent($self->{savedCaptureJRadioButton})->addComponent($self->{captureMotionAnalysisJCheckBox})->addComponent($self->{captureComparisonJCheckBox})->addComponent($self->{jLabel3}))->addContainerGap(22, 32767)));
        $jPanel1Layout->setVerticalGroup($jPanel1Layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($jPanel1Layout->createSequentialGroup()->addComponent($self->{jLabel1})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jLabel2})->addGap(7, 7, 7)->addComponent($self->{screenCaptureJRadioButton})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{savedCaptureJRadioButton})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jLabel3})->addGap(7, 7, 7)->addComponent($self->{captureComparisonJCheckBox})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{captureMotionAnalysisJCheckBox})->addContainerGap(106, 32767)));
        my $genericProfilesJPanelLayout = 'javax::swing::GroupLayout'->new($self->{genericProfilesJPanel});
        $self->{genericProfilesJPanel}->setLayout($genericProfilesJPanelLayout);
        $genericProfilesJPanelLayout->setHorizontalGroup($genericProfilesJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($genericProfilesJPanelLayout->createSequentialGroup()->addGroup($genericProfilesJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($genericProfilesJPanelLayout->createSequentialGroup()->addComponent($self->{newProfileJButton})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{deleteProfileJButton}))->addGroup($genericProfilesJPanelLayout->createSequentialGroup()->addComponent($self->{genericProfilesJScrollPane}, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jPanel1}, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 119, 32767)))->addContainerGap()));
        $genericProfilesJPanelLayout->setVerticalGroup($genericProfilesJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($genericProfilesJPanelLayout->createSequentialGroup()->addGroup($genericProfilesJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{newProfileJButton})->addComponent($self->{deleteProfileJButton}))->addPreferredGap($org::allbinary::input::automation::module::generic::configuration::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($genericProfilesJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{jPanel1}, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 246, 32767)->addComponent($self->{genericProfilesJScrollPane}, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 246, 32767))));
        $self->{genericJTabbedPane}->addTab("Profiles", $self->{genericProfilesJPanel});
        my $blankGenericProfileActionsJPanelLayout = 'javax::swing::GroupLayout'->new($self->{blankGenericProfileActionsJPanel});
        $self->{blankGenericProfileActionsJPanel}->setLayout($blankGenericProfileActionsJPanelLayout);
        $blankGenericProfileActionsJPanelLayout->setHorizontalGroup($blankGenericProfileActionsJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 395, 32767));
        $blankGenericProfileActionsJPanelLayout->setVerticalGroup($blankGenericProfileActionsJPanelLayout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 275, 32767));
        $self->{genericJTabbedPane}->addTab("Actions", $self->{blankGenericProfileActionsJPanel});
        $self->add($self->{genericJTabbedPane});
}


sub savedCaptureJRadioButtonActionPerformed {
    my ($self, $evt) = @_;
        try {
            if ($self->{savedCaptureJRadioButton}->isSelected()) {
                $self->{logUtil}->putF("Selected", $self, "savedCaptureJRadioButtonActionPerformed");
                $self->getSelectedGenericProfile()->add($org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::SAVED_CAPTURE);
                $self->getSelectedGenericProfile()->remove($org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::SCREEN_CAPTURE);
                $self->{screenCaptureJRadioButton}->setSelected(0);
                $self->getGenericProfiles()->save();
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "savedCaptureJRadioButtonActionPerformed", $e);
        }
}


sub screenCaptureJRadioButtonActionPerformed {
    my ($self, $evt) = @_;
        try {
            if ($self->{screenCaptureJRadioButton}->isSelected()) {
                $self->{logUtil}->putF("Selected", $self, "screenCaptureJRadioButtonActionPerformed");
                $self->getSelectedGenericProfile()->add($org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::SCREEN_CAPTURE);
                $self->getSelectedGenericProfile()->remove($org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::SAVED_CAPTURE);
                $self->{savedCaptureJRadioButton}->setSelected(0);
                $self->getGenericProfiles()->save();
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "screenCaptureJRadioButtonActionPerformed", $e);
        }
}


sub captureMotionAnalysisJCheckBoxActionPerformed {
    my ($self, $evt) = @_;
        try {
            if ($self->{captureMotionAnalysisJCheckBox}->isSelected()) {
                $self->getSelectedGenericProfile()->add($org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::MOTION);
            } else {
                $self->getSelectedGenericProfile()->remove($org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::MOTION);
            }
            $self->getGenericProfiles()->save();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "captureComparisonJCheckBoxActionPerformed", $e);
        }
}


sub captureComparisonJCheckBoxActionPerformed {
    my ($self, $evt) = @_;
        try {
            if ($self->{captureComparisonJCheckBox}->isSelected()) {
                $self->getSelectedGenericProfile()->add($org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::COMPARISON);
            } else {
                $self->getSelectedGenericProfile()->remove($org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::COMPARISON);
            }
            $self->getGenericProfiles()->save();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "captureComparisonJCheckBoxActionPerformed", $e);
        }
}


# throws Exception
sub updateProfileUI {
    my ($self, $profileNameString) = @_;
        $self->getBlankGenericProfileActionsJPanel()->removeAll();
        if (defined($profileNameString)) {
            my $genericProfileActionsJPanel = 'org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionsJPanel'->new();
            $self->setSelectedGenericProfile($self->getGenericProfiles()->get($profileNameString));
            $self->getSelectedGenericProfile()->setGenericProfileActions('org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActions'->new($genericProfileActionsJPanel, $profileNameString));
            $genericProfileActionsJPanel->setGenericProfileActions($self->getSelectedGenericProfile()->getGenericProfileActions());
            $genericProfileActionsJPanel->selectFirstElement();
            my $layout = $self->getBlankGenericProfileActionsJPanel()->getLayout();
            $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 395, 32767)->addComponent($genericProfileActionsJPanel, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{PREFERRED_SIZE}));
            $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 256, 32767)->addComponent($genericProfileActionsJPanel, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::module::generic::configuration::javax::swing->{GroupLayout}->{PREFERRED_SIZE}));
            $self->updateProfileOptions();
            $self->{logUtil}->putF("Setting Configuration Profile JPanel", $self, "updateProfileUI");
        } else {
            $self->{logUtil}->putF("Null Configuration Profile", $self, "updateProfileUI");
        }
}


# throws Exception
sub selectFirstElement {
    my ($self) = @_;
        $self->{genericProfilesJList}->setModel($self->getGenericProfiles()->getDefaultListModelHelper()->getListModel());
        if ($self->{genericProfilesJList}->getModel()->getSize() > 0) {
            $self->{genericProfilesJList}->setSelectedValue($self->{genericProfilesJList}->getModel()->getElementAt(0), 1);
            $self->updateProfileUI($self->{genericProfilesJList}->getModel()->getElementAt(0));
        }
}


# throws Exception
sub updateProfileOptions {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "updateProfileOptions");
        my $genericProfile = $self->getSelectedGenericProfile();
        my $vector = $genericProfile->getGenericProfileDataWorkerTypeVector();
        $self->{screenCaptureJRadioButton}->setSelected(0);
        $self->{savedCaptureJRadioButton}->setSelected(0);
        $self->{captureComparisonJCheckBox}->setSelected(0);
        $self->{captureMotionAnalysisJCheckBox}->setSelected(0);
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $genericProfileDataWorkerType = $vector->get($index);
            $self->{logUtil}->putF($genericProfile->getName() . " has GenericProfileDataWorkerType: " . $genericProfileDataWorkerType->toString(), $self, "updateProfileOptions");
            if ($genericProfileDataWorkerType == $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::SCREEN_CAPTURE) {
                $self->{logUtil}->putF("Screen Capture Selected", $self, "updateProfileOptions");
                $self->{screenCaptureJRadioButton}->setSelected(1);
            } elsif ($genericProfileDataWorkerType == $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::SAVED_CAPTURE) {
                $self->{logUtil}->putF("Saved Capture Selected", $self, "updateProfileOptions");
                $self->{savedCaptureJRadioButton}->setSelected(1);
            } elsif ($genericProfileDataWorkerType == $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::COMPARISON) {
                $self->{logUtil}->putF("Checking Comparison Box", $self, "updateProfileOptions");
                $self->{captureComparisonJCheckBox}->setSelected(1);
            } elsif ($genericProfileDataWorkerType == $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::MOTION) {
                $self->{logUtil}->putF("Checking Motion Box", $self, "updateProfileOptions");
                $self->{captureMotionAnalysisJCheckBox}->setSelected(1);
            }
        }
        if (!$self->{screenCaptureJRadioButton}->isSelected() && !$self->{savedCaptureJRadioButton}->isSelected()) {
            $self->{screenCaptureJRadioButton}->setSelected(1);
            $self->getSelectedGenericProfile()->add($org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::SCREEN_CAPTURE);
        }
        $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, "updateProfileOptions");
}


sub getBlankGenericProfileActionsJPanel {
    my ($self) = @_;
        return $self->{blankGenericProfileActionsJPanel};
}


sub setBlankGenericProfileActionsJPanel {
    my ($self, $blankGenericProfileActionsJPanel) = @_;
        $self->{blankGenericProfileActionsJPanel} = $blankGenericProfileActionsJPanel;
}


sub getGenericProfiles {
    my ($self) = @_;
        return $self->{genericProfiles};
}


sub setGenericProfiles {
    my ($self, $genericProfiles) = @_;
        $self->{genericProfiles} = $genericProfiles;
}


sub getSelectedGenericProfile {
    my ($self) = @_;
        return $self->{selectedGenericProfile};
}


sub setSelectedGenericProfile {
    my ($self, $selectedGenericProfile) = @_;
        $self->{selectedGenericProfile} = $selectedGenericProfile;
}


sub genericProfilesJListValueChanged {
    my ($self, $evt) = @_;
        try {
            my $profileNameString = $self->{genericProfilesJList}->getSelectedValue();
            $self->updateProfileUI($profileNameString);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "genericProfilesJListValueChanged", $e);
        }
}


sub deleteProfileJButtonActionPerformed {
    my ($self, $evt) = @_;
        try {
            my $anyType = $self->{genericProfilesJList}->getSelectedValues();
            for (my $index = 0; $index < scalar(@{$anyType}); $index++) {
                my $nextSelectedValueString = $anyType->[$index];
                $self->getGenericProfiles()->remove($nextSelectedValueString);
            }
            $self->selectFirstElement();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "deleteProfileJButtonActionPerformed", $e);
        }
}


sub okNewProfileJButtonActionPerformed {
    my ($self, $evt) = @_;
        try {
            my $newProfileName = $self->{newProfileNameJTextField}->getText();
            $self->getGenericProfiles()->add($newProfileName);
            $self->{genericProfilesJList}->setModel($self->getGenericProfiles()->getDefaultListModelHelper()->getListModel());
            $self->{genericProfilesJList}->setSelectedValue($newProfileName, 1);
            $self->{newProfileJDialog}->setVisible(0);
            $self->updateProfileUI($newProfileName);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "okNewProfileJButtonActionPerformed", $e);
        }
}


sub newProfileJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->{newProfileJDialog}->setVisible(1);
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfile;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfiles;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActions;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionsJPanel;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::input::automation::module::generic::configuration::GenericModuleConfigurationInterface;

1;

