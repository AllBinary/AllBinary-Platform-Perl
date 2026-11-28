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

package org::allbinary::input::automation::InputAutomationJFrame;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','bundle::input::automation::module::configuration::InputAutomationConfigurationModuleChangeListener','bundle::input::automation::robot::InputAutomationRobotChangeListener';

our $INPUTAUTOMATION_JFRAME = undef;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{inputAutomationModuleConfigurations} = 'org::allbinary::input::automation::module::configuration::InputAutomationModuleConfigurations'->new();
    $self->{inputAutomationModuleFactory} = undef unless exists $self->{inputAutomationModuleFactory};
    $self->{inputAutomationModuleInterface} = undef unless exists $self->{inputAutomationModuleInterface};
    $self->{runnableInterface} = undef unless exists $self->{runnableInterface};
    $self->{thread} = undef unless exists $self->{thread};
    $self->{helpSet} = undef unless exists $self->{helpSet};
    $self->{uri} = 'java::net::URI'->new("http://geocities.com/allbinary/");
    $self->{aboutJMenuItem} = undef unless exists $self->{aboutJMenuItem};
    $self->{automationModuleConfigurationJPanel} = undef unless exists $self->{automationModuleConfigurationJPanel};
    $self->{gameRobotJTabbedPane} = undef unless exists $self->{gameRobotJTabbedPane};
    $self->{helpJMenuItem} = undef unless exists $self->{helpJMenuItem};
    $self->{inputAutomationModuleJList} = undef unless exists $self->{inputAutomationModuleJList};
    $self->{inputAutomationModuleJPanel} = undef unless exists $self->{inputAutomationModuleJPanel};
    $self->{jScrollPane1} = undef unless exists $self->{jScrollPane1};
    $self->{mainJMenuBar} = undef unless exists $self->{mainJMenuBar};
    $self->{modulesJMenuItem} = undef unless exists $self->{modulesJMenuItem};
    $self->{noModuleSelectedJDialog} = undef unless exists $self->{noModuleSelectedJDialog};
    $self->{noModuleSelectedJLabel} = undef unless exists $self->{noModuleSelectedJLabel};
    $self->{optionsJMenu} = undef unless exists $self->{optionsJMenu};
    $self->{processingJMenu} = undef unless exists $self->{processingJMenu};
    $self->{startJMenuItem} = undef unless exists $self->{startJMenuItem};
    $self->{stopJMenuItem} = undef unless exists $self->{stopJMenuItem};
    $self->{stopOnFocusJCheckBoxMenuItem} = undef unless exists $self->{stopOnFocusJCheckBoxMenuItem};
    $self->{subscriptionJMenuItem} = undef unless exists $self->{subscriptionJMenuItem};
    $self->{toolsJMenu} = undef unless exists $self->{toolsJMenu};
    $self->{updatesJMenuItem} = undef unless exists $self->{updatesJMenuItem};
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->initComponents();
        my $url = ref($self)->getResource("/help/Help.hs");
        $self->{logUtil}->putF("URL: " . $url, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->{helpSet} = 'org::allbinary::logic::java::help::JavaHelpUtil'->getInstance()->getHelpSet($url);
        $url = ref($self)->getResource("/resources/allbinaryicon8bit.jpg");
        my $imageIcon = 'javax::swing::ImageIcon'->new($url);
        $self->setIconImage($imageIcon->getImage());
        $self->init();
    return $self;
}


sub helpSetAdded {
    my ($self, $helpSetEvent) = @_;
        $self->{helpSet}->add($helpSetEvent->getHelpSet());
}


sub helpSetRemoved {
    my ($self, $helpSetEvent) = @_;
        $self->{helpSet}->remove($helpSetEvent->getHelpSet());
}


# throws Exception
sub init {
    my ($self) = @_;
        my $inputAutomationConfigurationFactory = 'org::allbinary::input::automation::configuration::InputAutomationConfigurationFactory'->getInstance();
        $inputAutomationConfigurationFactory->init('org::allbinary::logic::system::security::licensing::InputAutomationClientInformationFactory'->getInstance());
        my $inputAutomationModuleConfigurationList = $inputAutomationConfigurationFactory->{inputAutomationConfiguration}->getInputAutomationModuleConfigurationList();
        if (!defined($inputAutomationModuleConfigurationList)) {
        } else {
            $self->{inputAutomationModuleConfigurations} = 'org::allbinary::input::automation::module::configuration::InputAutomationModuleConfigurations'->new($inputAutomationModuleConfigurationList);
        }
        $self->{inputAutomationModuleFactory} = 'org::allbinary::input::automation::module::InputAutomationModuleFactoryFactory'->new($self->{inputAutomationModuleConfigurations}, $self);
        ('org::allbinary::gui::swing::workers::JListSwingWorker'->new($self->{inputAutomationModuleJList}, $self->{inputAutomationModuleFactory}->getListModel()))->execute();
        $self->{gameRobotJTabbedPane}->setEnabledAt(1, 0);
        $self->{gameRobotJTabbedPane}->setSelectedIndex(0);
}


sub initComponents {
    my ($self) = @_;
        $self->{noModuleSelectedJDialog} = 'javax::swing::JDialog'->new();
        $self->{noModuleSelectedJLabel} = 'javax::swing::JLabel'->new();
        $self->{gameRobotJTabbedPane} = 'javax::swing::JTabbedPane'->new();
        $self->{inputAutomationModuleJPanel} = 'javax::swing::JPanel'->new();
        $self->{jScrollPane1} = 'javax::swing::JScrollPane'->new();
        $self->{inputAutomationModuleJList} = 'javax::swing::JList'->new();
        $self->{automationModuleConfigurationJPanel} = 'javax::swing::JPanel'->new();
        $self->{mainJMenuBar} = 'javax::swing::JMenuBar'->new();
        $self->{processingJMenu} = 'javax::swing::JMenu'->new();
        $self->{startJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{stopJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{optionsJMenu} = 'javax::swing::JMenu'->new();
        $self->{stopOnFocusJCheckBoxMenuItem} = 'javax::swing::JCheckBoxMenuItem'->new();
        $self->{toolsJMenu} = 'javax::swing::JMenu'->new();
        $self->{helpJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{updatesJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{subscriptionJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{modulesJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{aboutJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{noModuleSelectedJDialog}->setMinimumSize('java::awt::Dimension'->new(200, 100));
        $self->{noModuleSelectedJLabel}->setText("Please Select A Module");
        my $noModuleSelectedJDialogLayout = 'javax::swing::GroupLayout'->new($self->{noModuleSelectedJDialog}->getContentPane());
        $self->{noModuleSelectedJDialog}->getContentPane()->setLayout($noModuleSelectedJDialogLayout);
        $noModuleSelectedJDialogLayout->setHorizontalGroup($noModuleSelectedJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($noModuleSelectedJDialogLayout->createSequentialGroup()->addContainerGap()->addComponent($self->{noModuleSelectedJLabel})->addContainerGap($javax::swing::GroupLayout::DEFAULT_SIZE, 32767)));
        $noModuleSelectedJDialogLayout->setVerticalGroup($noModuleSelectedJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{noModuleSelectedJLabel}, $javax::swing::GroupLayout::Alignment->{TRAILING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 48, 32767));
        $self->setDefaultCloseOperation($javax::swing::WindowConstants::EXIT_ON_CLOSE);
        $self->setMinimumSize('java::awt::Dimension'->new(325, 215));
        $self->setResizable(0);
        $self->addWindowFocusListener(do {
            package java::awt::event::WindowFocusListener::AnonymousN69680 { our @ISA = ('java::awt::event::WindowFocusListener', 'java::lang::Object');
            

            sub windowGainedFocus {
                my ($self, $evt) = @_;
                $self->formWindowGainedFocus($evt);
            }
            

            sub windowLostFocus {
                my ($self, $evt) = @_;
                $self->formWindowLostFocus($evt);
            }
            }
            'java::awt::event::WindowFocusListener::AnonymousN69680'->can('new') ? 'java::awt::event::WindowFocusListener::AnonymousN69680'->new() : bless({}, 'java::awt::event::WindowFocusListener::AnonymousN69680')
        });
        $self->addFocusListener(do {
            package java::awt::event::FocusAdapter::AnonymousN69846 { our @ISA = ('java::awt::event::FocusAdapter', 'java::lang::Object');
            

            sub focusGained {
                my ($self, $evt) = @_;
                $self->formFocusGained($evt);
            }
            

            sub focusLost {
                my ($self, $evt) = @_;
                $self->formFocusLost($evt);
            }
            }
            'java::awt::event::FocusAdapter::AnonymousN69846'->can('new') ? 'java::awt::event::FocusAdapter::AnonymousN69846'->new() : bless({}, 'java::awt::event::FocusAdapter::AnonymousN69846')
        });
        $self->{gameRobotJTabbedPane}->setMinimumSize('java::awt::Dimension'->new(320, 200));
        $self->{inputAutomationModuleJList}->setMinimumSize('java::awt::Dimension'->new(200, 0));
        $self->{inputAutomationModuleJList}->addListSelectionListener(do {
            package javax::swing::event::ListSelectionListener::AnonymousN70121 { our @ISA = ('javax::swing::event::ListSelectionListener', 'java::lang::Object');
            

            sub valueChanged {
                my ($self, $evt) = @_;
                $self->inputAutomationModuleJListValueChanged($evt);
            }
            }
            'javax::swing::event::ListSelectionListener::AnonymousN70121'->can('new') ? 'javax::swing::event::ListSelectionListener::AnonymousN70121'->new() : bless({}, 'javax::swing::event::ListSelectionListener::AnonymousN70121')
        });
        $self->{jScrollPane1}->setViewportView($self->{inputAutomationModuleJList});
        my $inputAutomationModuleJPanelLayout = 'javax::swing::GroupLayout'->new($self->{inputAutomationModuleJPanel});
        $self->{inputAutomationModuleJPanel}->setLayout($inputAutomationModuleJPanelLayout);
        $inputAutomationModuleJPanelLayout->setHorizontalGroup($inputAutomationModuleJPanelLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($inputAutomationModuleJPanelLayout->createSequentialGroup()->addComponent($self->{jScrollPane1}, $javax::swing::GroupLayout::PREFERRED_SIZE, 199, $javax::swing::GroupLayout::PREFERRED_SIZE)->addContainerGap(367, 32767)));
        $inputAutomationModuleJPanelLayout->setVerticalGroup($inputAutomationModuleJPanelLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($inputAutomationModuleJPanelLayout->createSequentialGroup()->addComponent($self->{jScrollPane1}, $javax::swing::GroupLayout::PREFERRED_SIZE, 330, $javax::swing::GroupLayout::PREFERRED_SIZE)->addContainerGap($javax::swing::GroupLayout::DEFAULT_SIZE, 32767)));
        $self->{gameRobotJTabbedPane}->addTab("Modules", $self->{inputAutomationModuleJPanel});
        my $automationModuleConfigurationJPanelLayout = 'javax::swing::GroupLayout'->new($self->{automationModuleConfigurationJPanel});
        $self->{automationModuleConfigurationJPanel}->setLayout($automationModuleConfigurationJPanelLayout);
        $automationModuleConfigurationJPanelLayout->setHorizontalGroup($automationModuleConfigurationJPanelLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGap(0, 566, 32767));
        $automationModuleConfigurationJPanelLayout->setVerticalGroup($automationModuleConfigurationJPanelLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGap(0, 334, 32767));
        $self->{gameRobotJTabbedPane}->addTab("Configuration", $self->{automationModuleConfigurationJPanel});
        $self->{processingJMenu}->setText("Processing");
        $self->{processingJMenu}->setToolTipText("Set module processing state");
        $self->{startJMenuItem}->setText($self->{commonStrings}->{START});
        $self->{startJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71194 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->startJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71194'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71194'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71194')
        });
        $self->{processingJMenu}->add($self->{startJMenuItem});
        $self->{stopJMenuItem}->setText("Stop");
        $self->{stopJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71370 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->stopJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71370'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71370'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71370')
        });
        $self->{processingJMenu}->add($self->{stopJMenuItem});
        $self->{mainJMenuBar}->add($self->{processingJMenu});
        $self->{optionsJMenu}->setText("Options");
        $self->{optionsJMenu}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71583 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->optionsJMenuActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71583'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71583'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71583')
        });
        $self->{stopOnFocusJCheckBoxMenuItem}->setSelected(1);
        $self->{stopOnFocusJCheckBoxMenuItem}->setEnabled(0);
        $self->{stopOnFocusJCheckBoxMenuItem}->setLabel("Stop Module On Focus");
        $self->{stopOnFocusJCheckBoxMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71782 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->stopOnFocusJCheckBoxMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71782'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71782'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71782')
        });
        $self->{optionsJMenu}->add($self->{stopOnFocusJCheckBoxMenuItem});
        $self->{mainJMenuBar}->add($self->{optionsJMenu});
        $self->{toolsJMenu}->setText("Help");
        $self->{helpJMenuItem}->setText("Help");
        $self->{helpJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72025 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->helpJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72025'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72025'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72025')
        });
        $self->{toolsJMenu}->add($self->{helpJMenuItem});
        $self->{updatesJMenuItem}->setText("Updates");
        $self->{updatesJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72201 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->updatesJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72201'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72201'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72201')
        });
        $self->{toolsJMenu}->add($self->{updatesJMenuItem});
        $self->{subscriptionJMenuItem}->setText("Subscription");
        $self->{subscriptionJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72377 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->subscriptionJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72377'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72377'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72377')
        });
        $self->{toolsJMenu}->add($self->{subscriptionJMenuItem});
        $self->{modulesJMenuItem}->setText("Module Manager");
        $self->{modulesJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72553 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->modulesJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72553'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72553'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72553')
        });
        $self->{toolsJMenu}->add($self->{modulesJMenuItem});
        $self->{aboutJMenuItem}->setText("About");
        $self->{aboutJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72729 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->aboutJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72729'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72729'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72729')
        });
        $self->{toolsJMenu}->add($self->{aboutJMenuItem});
        $self->{mainJMenuBar}->add($self->{toolsJMenu});
        $self->setJMenuBar($self->{mainJMenuBar});
        my $layout = 'javax::swing::GroupLayout'->new($self->getContentPane());
        $self->getContentPane()->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{gameRobotJTabbedPane}, $javax::swing::GroupLayout::Alignment->{TRAILING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 571, 32767));
        $layout->setVerticalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{gameRobotJTabbedPane}, $javax::swing::GroupLayout::Alignment->{TRAILING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 359, 32767));
        $self->pack();
}


sub subscriptionJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            'java::awt::Desktop'->getDesktop()->browse($self->{uri});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "subscriptionJMenuItemActionPerformed", $e);
        }
}


sub updatesJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            'java::awt::Desktop'->getDesktop()->browse($self->{uri});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "updatesJMenuItemActionPerformed", $e);
        }
}


sub aboutJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        my $textJDialog = 'org::allbinary::gui::dialog::BasicTextJDialog'->new("Copyright (c) 2002-2007 AllBinary");
        $textJDialog->setVisible(1);
        $textJDialog->setLocationRelativeTo($self);
}


sub modulesJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            'org::allbinary::input::automation::osgi::DesktopBundle'->new()->start();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "modulesJMenuItemActionPerformed", $e);
        }
}


sub helpJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        'org::allbinary::logic::java::help::JavaHelpUtil'->getInstance()->show($self->{helpSet});
}


sub stopOnFocusJCheckBoxMenuItemActionPerformed {
    my ($self, $evt) = @_;
}


sub optionsJMenuActionPerformed {
    my ($self, $evt) = @_;
}


sub formWindowLostFocus {
    my ($self, $evt) = @_;
        $self->{logUtil}->putF("Nothing", $self, "focusLost");
}


sub formWindowGainedFocus {
    my ($self, $evt) = @_;
        if ($self->{stopOnFocusJCheckBoxMenuItem}->isSelected()) {
            $self->{logUtil}->putF("Stopping", $self, "focusGained");
            if (defined($self->{runnableInterface})) {
                $self->{runnableInterface}->setRunning(0);
            }
        }
}


sub formFocusLost {
    my ($self, $evt) = @_;
}


sub formFocusGained {
    my ($self, $evt) = @_;
}


sub inputAutomationModuleJListValueChanged {
    my ($self, $evt) = @_;
        try {
            my $gameAutomationRobotModuleNameString = $self->{inputAutomationModuleJList}->getSelectedValue();
            if (defined($gameAutomationRobotModuleNameString)) {
                $self->{inputAutomationModuleInterface} = $self->{inputAutomationModuleFactory}->getInstance($gameAutomationRobotModuleNameString);
                $self->getAutomationModuleConfigurationJPanel()->removeAll();
                my $layout = $self->getAutomationModuleConfigurationJPanel()->getLayout();
                $layout->setHorizontalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGap(0, 395, 32767)->addComponent($self->{inputAutomationModuleInterface}->getConfigurationJPanel(), $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE));
                $layout->setVerticalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGap(0, 256, 32767)->addComponent($self->{inputAutomationModuleInterface}->getConfigurationJPanel(), $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE));
                $self->{gameRobotJTabbedPane}->setEnabledAt(1, 1);
                $self->{logUtil}->putF("Setting Module: " . $gameAutomationRobotModuleNameString . " and Configuration JPanel", $self, "gameAutomationRobotModuleJListValueChanged");
            } else {
                $self->{logUtil}->putF("Module name was null", $self, "gameAutomationRobotModuleJListValueChanged");
                $self->{gameRobotJTabbedPane}->setEnabledAt(1, 0);
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "gameAutomationRobotModuleJListValueChanged", $e);
        }
}


sub stopJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        if (defined($self->{runnableInterface})) {
            $self->{runnableInterface}->setRunning(0);
        } else {
            $self->{noModuleSelectedJDialog}->setVisible(1);
            $self->{noModuleSelectedJDialog}->setLocationRelativeTo($self);
        }
}


sub startJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->{logUtil}->putF("Starting", $self, "startJMenuItemActionPerformed");
            if (defined($self->{inputAutomationModuleInterface})) {
                $self->{runnableInterface} = $self->{inputAutomationModuleInterface}->getInstance();
                if (defined($self->{runnableInterface})) {
                    $self->{thread} = 'java::lang::Thread'->new($self->{runnableInterface});
                    $self->{thread}->setPriority($java::lang::Thread::MIN_PRIORITY + 1);
                    $self->{thread}->start();
                } else {
                    $self->{logUtil}->putF("Runnnable was null", $self, "startJMenuItemActionPerformed");
                    $self->{noModuleSelectedJDialog}->setVisible(1);
                    $self->{noModuleSelectedJDialog}->setLocationRelativeTo($self);
                }
            } else {
                $self->{logUtil}->putF("InputAutomationModuleInterface was null", $self, "startJMenuItemActionPerformed");
                $self->{noModuleSelectedJDialog}->setVisible(1);
                $self->{noModuleSelectedJDialog}->setLocationRelativeTo($self);
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "startJMenuItemActionPerformed", $e);
        }
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::automation::InputAutomationJFrame::INPUTAUTOMATION_JFRAME;
}


sub destroy {
    my ($class) = @_;
        $org::allbinary::input::automation::InputAutomationJFrame::INPUTAUTOMATION_JFRAME->setVisible(0);
}


sub create {
    my ($class, $inputAutomationBundleActivatorListenerInterface) = @_;
        'org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance();
        my $appUrlGlobals = 'org::allbinary::globals::AppUrlGlobals'->new();
        $appUrlGlobals->setWebappPath("G:/mnt/bc/mydev/work_automation/automation/run/");
        'org::allbinary::globals::URLGLOBALS'->init($appUrlGlobals);
        'org::allbinary::logic::system::loader::WebappClassLoaderInfo'->setLoader(ref($appUrlGlobals)->getClassLoader());
        'java::awt::EventQueue'->invokeLater(do {
            package org::allbinary::thread::ARunnable::AnonymousN76836 { our @ISA = ('org::allbinary::thread::ARunnable', 'java::lang::Object');
            

            sub run {
                my ($self) = @_;
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                try {
                    $logUtil->putF("Running", $self, $commonStrings->{RUN});
                    $INPUTAUTOMATION_JFRAME = 'org::allbinary::input::automation::InputAutomationJFrame'->new();
                    'org::allbinary::input::automation::robot::InputRobotFactory'->getInstance()->addListener('org::allbinary::input::automation::InputAutomationJFrame'->getInstance());
                    if (defined($inputAutomationBundleActivatorListenerInterface)) {
                        $inputAutomationBundleActivatorListenerInterface->registerAsService();
                        $inputAutomationBundleActivatorListenerInterface->useServices();
                    }
                    $INPUTAUTOMATION_JFRAME->setVisible(1);
                } catch ($e) {
                    $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
                }
            }
            }
            'org::allbinary::thread::ARunnable::AnonymousN76836'->can('new') ? 'org::allbinary::thread::ARunnable::AnonymousN76836'->new() : bless({}, 'org::allbinary::thread::ARunnable::AnonymousN76836')
        });
}


# throws Exception
sub main {
    my ($class, $args) = @_;
        'org::allbinary::input::automation::InputAutomationJFrame'->create(undef);
}


sub getAutomationModuleConfigurationJPanel {
    my ($self) = @_;
        return $self->{automationModuleConfigurationJPanel};
}


sub setAutomationModuleConfigurationJPanel {
    my ($self, $automationModuleConfigurationJPanel) = @_;
        $self->{automationModuleConfigurationJPanel} = $automationModuleConfigurationJPanel;
}


sub onAdd_j1_1 {
    my ($self, $inputAutomationRobotChangeEvent) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "onAdd");
            'org::allbinary::input::automation::robot::InputRobotFactory'->getInstance()->add($inputAutomationRobotChangeEvent->getInputAutomationRobotInterfaceWrapper()->getInputRobotInterface());
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "onAdd", $e);
        }
}


sub onRemove_j1_1 {
    my ($self, $inputAutomationRobotChangeEvent) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "onRemove");
            'org::allbinary::input::automation::robot::InputRobotFactory'->getInstance()->add($inputAutomationRobotChangeEvent->getInputAutomationRobotInterfaceWrapper()->getInputRobotInterface());
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "onRemove", $e);
        }
}


sub onAdd_j1_2 {
    my ($self, $inputAutomationConfigurationChangeEvent) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "onAdd");
            $self->{inputAutomationModuleConfigurations}->add($inputAutomationConfigurationChangeEvent->getInputAutomationModuleConfiguration());
            $self->init();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "onAdd", $e);
        }
}

sub onAdd {
    my ($invocant, @arguments) = @_;
    return $invocant->onAdd_j1(@arguments) if scalar(@arguments) == 1;
    die "No method onAdd takes " . scalar(@arguments) . " arguments";
}

sub onAdd_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->onAdd_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->onAdd_j1_2(@arguments);
}


sub onRemove_j1_2 {
    my ($self, $inputAutomationConfigurationChangeEvent) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "onRemove");
            my $inputAutomationConfiguration = 'org::allbinary::input::automation::configuration::InputAutomationConfigurationFactory'->getInstance()->{inputAutomationConfiguration};
            my $inputAutomationModuleConfigurationList = $inputAutomationConfiguration->getInputAutomationModuleConfigurationList();
            if (!defined($inputAutomationModuleConfigurationList)) {
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $logUtil->putF("inputAutomationModuleConfigurationList: " . $inputAutomationModuleConfigurationList, $self, $commonStrings->{INIT});
                die ("Exception");
            }
            my $inputAutomationModuleConfigurations = 'org::allbinary::input::automation::module::configuration::InputAutomationModuleConfigurations'->new($inputAutomationConfiguration->getInputAutomationModuleConfigurationList());
            $inputAutomationModuleConfigurations->remove($inputAutomationConfigurationChangeEvent->getInputAutomationModuleConfiguration());
            $self->init();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "onRemove", $e);
        }
}

sub onRemove {
    my ($invocant, @arguments) = @_;
    return $invocant->onRemove_j1(@arguments) if scalar(@arguments) == 1;
    die "No method onRemove takes " . scalar(@arguments) . " arguments";
}

sub onRemove_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->onRemove_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->onRemove_j1_2(@arguments);
}

use java::lang::Object ();
use org::allbinary::thread::ARunnable ();
# use java::net::URI ();
# use java::net::URL ();
# use java::awt::Desktop ();
# use java::util::List ();
# use javax::swing::ImageIcon ();
# use javax::swing::JDialog ();
# use javax::help::HelpSet ();
# use javax::help::event::HelpSetEvent ();
# use javax::help::event::HelpSetListener ();
use bundle::input::automation::InputAutomationBundleActivatorListenerInterface ();
use bundle::input::automation::module::configuration::InputAutomationConfigurationModuleChangeListener ();
use bundle::input::automation::robot::InputAutomationRobotChangeListener ();
use org::allbinary::globals::AppUrlGlobals ();
use org::allbinary::globals::URLGLOBALS ();
use org::allbinary::gui::dialog::BasicTextJDialog ();
use org::allbinary::gui::swing::workers::JListSwingWorker ();
use org::allbinary::input::automation::configuration::InputAutomationConfiguration ();
use org::allbinary::input::automation::configuration::InputAutomationConfigurationFactory ();
use org::allbinary::input::automation::configuration::InputAutomationConfigurationModuleChangeEvent ();
use org::allbinary::input::automation::module::InputAutomationModuleFactoryFactory ();
use org::allbinary::input::automation::module::InputAutomationModuleFactoryInterface ();
use org::allbinary::input::automation::module::configuration::InputAutomationModuleConfiguration ();
use org::allbinary::input::automation::module::configuration::InputAutomationModuleConfigurations ();
use org::allbinary::input::automation::osgi::DesktopBundle ();
use org::allbinary::input::automation::robot::InputRobotFactory ();
use org::allbinary::input::automation::robot::osgi::InputAutomationRobotChangeEvent ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::java::help::JavaHelpUtil ();
use org::allbinary::logic::system::loader::WebappClassLoaderInfo ();
use org::allbinary::logic::system::security::licensing::InputAutomationClientInformationFactory ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::thread::RunnableInterface ();
# use java::awt::Dimension ();
# use java::awt::EventQueue ();
# use java::awt::event::ActionEvent ();
# use java::awt::event::ActionListener ();
# use java::awt::event::FocusAdapter ();
# use java::awt::event::FocusEvent ();
# use java::awt::event::WindowEvent ();
# use java::awt::event::WindowFocusListener ();
# use javax::swing::GroupLayout ();
# use javax::swing::JCheckBoxMenuItem ();
# use javax::swing::JFrame ();
# use javax::swing::JLabel ();
# use javax::swing::JList ();
# use javax::swing::JMenu ();
# use javax::swing::JMenuBar ();
# use javax::swing::JMenuItem ();
# use javax::swing::JPanel ();
# use javax::swing::JScrollPane ();
# use javax::swing::JTabbedPane ();
# use javax::swing::WindowConstants ();
# use javax::swing::event::ListSelectionEvent ();
# use javax::swing::event::ListSelectionListener ();
use java::lang::Thread ();

1;

