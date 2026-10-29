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

package org::allbinary::image::gui::ImageToolJFrame;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JFrame','org::allbinary::gui::dialog::FileJDialogListenerInterface';

our $imageProcessorInputCompositeInterface = undef;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{fileJDialog} = undef;
    $self->{imageProcessorInput} = undef;
    $self->{analysisActionJDialog} = undef;
    $self->{analyzeJMenuItem} = undef;
    $self->{blueJLabel} = undef;
    $self->{colorRangeJLabel} = undef;
    $self->{createStripImageJMenuItem} = undef;
    $self->{fileJMenu} = undef;
    $self->{generateSpriteSplitterMenuItem} = undef;
    $self->{generateRotationMenuItem} = undef;
    $self->{generateMirrorSpriteMenuItem} = undef;
    $self->{generateRotationSpriteJMenuItem} = undef;
    $self->{greenJLabel} = undef;
    $self->{jPanel1} = undef;
    $self->{mainJMenuBar} = undef;
    $self->{maxBlueJTextField} = undef;
    $self->{maxGreenJTextField} = undef;
    $self->{maxJLabel} = undef;
    $self->{maxRedJTextField} = undef;
    $self->{minBlueJTextField} = undef;
    $self->{minGreenJTextField} = undef;
    $self->{minJLabel} = undef;
    $self->{minRedJTextField} = undef;
    $self->{mirrorJMenuItem} = undef;
    $self->{okJButton} = undef;
    $self->{openImageJMenuItem} = undef;
    $self->{processingJMenu} = undef;
    $self->{redJLabel} = undef;
    $self->{scaleImagesJMenuItem} = undef;
    $self->{canvasImagesJMenuItem} = undef;
    $self->{createIconImagesJMenuItem} = undef;
    $self->{titleJLabel} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->initComponents();
        my $commonPhoneStrings = 'org::allbinary::string::CommonPhoneStrings'->getInstance();
        $self->setSize(640, 480);
        $self->getMaxRedJTextField()->setText("255");
        $self->getMaxGreenJTextField()->setText("255");
        $self->getMaxBlueJTextField()->setText("255");
        $self->getMinRedJTextField()->setText($commonPhoneStrings->{ZERO});
        $self->getMinGreenJTextField()->setText($commonPhoneStrings->{ZERO});
        $self->getMinBlueJTextField()->setText($commonPhoneStrings->{ZERO});
        $self->{fileJDialog} = 'org::allbinary::gui::dialog::FileJDialog'->new();
        $self->{fileJDialog}->addFinishedListener($self);
    return $self;
}


sub initComponents {
    my ($self) = @_;
        $self->{analysisActionJDialog} = 'javax::swing::JDialog'->new();
        $self->{titleJLabel} = 'javax::swing::JLabel'->new();
        $self->{colorRangeJLabel} = 'javax::swing::JLabel'->new();
        $self->{redJLabel} = 'javax::swing::JLabel'->new();
        $self->{minJLabel} = 'javax::swing::JLabel'->new();
        $self->{maxJLabel} = 'javax::swing::JLabel'->new();
        $self->{greenJLabel} = 'javax::swing::JLabel'->new();
        $self->{blueJLabel} = 'javax::swing::JLabel'->new();
        $self->{minRedJTextField} = 'javax::swing::JTextField'->new();
        $self->{maxRedJTextField} = 'javax::swing::JTextField'->new();
        $self->{maxGreenJTextField} = 'javax::swing::JTextField'->new();
        $self->{minBlueJTextField} = 'javax::swing::JTextField'->new();
        $self->{maxBlueJTextField} = 'javax::swing::JTextField'->new();
        $self->{okJButton} = 'javax::swing::JButton'->new();
        $self->{minGreenJTextField} = 'javax::swing::JTextField'->new();
        $self->{jPanel1} = 'javax::swing::JPanel'->new();
        $self->{mainJMenuBar} = 'javax::swing::JMenuBar'->new();
        $self->{fileJMenu} = 'javax::swing::JMenu'->new();
        $self->{openImageJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{processingJMenu} = 'javax::swing::JMenu'->new();
        $self->{analyzeJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{generateSpriteSplitterMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{generateRotationMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{generateMirrorSpriteMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{generateRotationSpriteJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{createStripImageJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{mirrorJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{scaleImagesJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{canvasImagesJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{createIconImagesJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{analysisActionJDialog}->setMinimumSize('java::awt::Dimension'->new(350, 250));
        $self->{titleJLabel}->setText("              Color At Action Options            ");
        $self->{colorRangeJLabel}->setText("Color Range");
        $self->{redJLabel}->setText("Red:");
        $self->{minJLabel}->setText("Minimum");
        $self->{maxJLabel}->setText("Maximum");
        $self->{greenJLabel}->setText("Green:");
        $self->{blueJLabel}->setText("Blue:");
        $self->{okJButton}->setText("OK");
        $self->{okJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68443 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->okJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68443'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68443'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68443')
        });
        my $analysisActionJDialogLayout = 'org::jdesktop::layout::GroupLayout'->new($self->{analysisActionJDialog}->getContentPane());
        $self->{analysisActionJDialog}->getContentPane()->setLayout($analysisActionJDialogLayout);
        $analysisActionJDialogLayout->setHorizontalGroup($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($analysisActionJDialogLayout->createSequentialGroup()->addContainerGap()->add($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($analysisActionJDialogLayout->createSequentialGroup()->add($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($self->{blueJLabel})->add($self->{greenJLabel})->add($self->{redJLabel})->add($self->{colorRangeJLabel}))->add(29, 29, 29)->add($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{TRAILING}, $self->{minJLabel}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 58, 32767)->add($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{TRAILING}, 0)->add($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING}, $self->{minBlueJTextField})->add($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING}, $self->{minGreenJTextField})->add($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING}, $self->{minRedJTextField}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 42, 32767)->add($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING}, $self->{okJButton})))->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{TRAILING})->add($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING}, $analysisActionJDialogLayout->createSequentialGroup()->add($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{TRAILING}, 0)->add($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING}, $self->{maxRedJTextField})->add($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING}, $analysisActionJDialogLayout->createSequentialGroup()->add(1, 1, 1)->add($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($self->{maxBlueJTextField})->add($self->{maxGreenJTextField}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, 43, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}))))->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED}, 17, 32767))->add($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING}, $self->{maxJLabel}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 61, 32767))->addContainerGap())->add($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{TRAILING}, $analysisActionJDialogLayout->createSequentialGroup()->add($self->{titleJLabel})->add(25, 25, 25)))));
        $analysisActionJDialogLayout->setVerticalGroup($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($analysisActionJDialogLayout->createSequentialGroup()->add($self->{titleJLabel})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{BASELINE})->add($self->{minJLabel})->add($self->{colorRangeJLabel})->add($self->{maxJLabel}))->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{TRAILING})->add($self->{redJLabel})->add($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{BASELINE})->add($self->{minRedJTextField}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})->add($self->{maxRedJTextField}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})))->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{TRAILING})->add($self->{greenJLabel})->add($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{BASELINE})->add($self->{minGreenJTextField}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})->add($self->{maxGreenJTextField}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})))->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{TRAILING})->add($self->{blueJLabel})->add($analysisActionJDialogLayout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{BASELINE})->add($self->{minBlueJTextField}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})->add($self->{maxBlueJTextField}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})))->add(16, 16, 16)->add($self->{okJButton})->addContainerGap($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)));
        $self->setDefaultCloseOperation($org::allbinary::image::gui::javax::swing->{WindowConstants}->{EXIT_ON_CLOSE});
        $self->getContentPane()->setLayout('java::awt::GridLayout'->new(1, 0));
        $self->{jPanel1}->setLayout('java::awt::GridLayout'->new(1, 0));
        $self->getContentPane()->add($self->{jPanel1});
        $self->{fileJMenu}->setText("File");
        $self->{fileJMenu}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72720 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->fileJMenuActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72720'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72720'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72720')
        });
        $self->{openImageJMenuItem}->setText("Open");
        $self->{openImageJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72907 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->openImageJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72907'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72907'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72907')
        });
        $self->{fileJMenu}->add($self->{openImageJMenuItem});
        $self->{mainJMenuBar}->add($self->{fileJMenu});
        $self->{processingJMenu}->setText("Processing");
        $self->{processingJMenu}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN73168 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->processingJMenuActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN73168'->can('new') ? 'java::awt::event::ActionListener::AnonymousN73168'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN73168')
        });
        $self->{analyzeJMenuItem}->setText("Image Analyze");
        $self->{analyzeJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN73355 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->analyzeJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN73355'->can('new') ? 'java::awt::event::ActionListener::AnonymousN73355'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN73355')
        });
        $self->{processingJMenu}->add($self->{analyzeJMenuItem});
        $self->{generateMirrorSpriteMenuItem}->setText("Mirror Sprite Generator");
        $self->{generateMirrorSpriteMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN73579 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->generateMirrorSpriteMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN73579'->can('new') ? 'java::awt::event::ActionListener::AnonymousN73579'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN73579')
        });
        $self->{processingJMenu}->add($self->{generateMirrorSpriteMenuItem});
        $self->{generateRotationSpriteJMenuItem}->setText("Rotation Sprite Generator");
        $self->{generateRotationSpriteJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN73803 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->generateRotationSpriteJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN73803'->can('new') ? 'java::awt::event::ActionListener::AnonymousN73803'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN73803')
        });
        $self->{processingJMenu}->add($self->{generateRotationSpriteJMenuItem});
        $self->{generateSpriteSplitterMenuItem}->setText("Sprite Splitter Generator");
        $self->{generateSpriteSplitterMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN74027 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->generateSpriteSplitterMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN74027'->can('new') ? 'java::awt::event::ActionListener::AnonymousN74027'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN74027')
        });
        $self->{processingJMenu}->add($self->{generateSpriteSplitterMenuItem});
        $self->{generateRotationMenuItem}->setText("Rotate Image Generator");
        $self->{generateRotationMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN74251 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->generateRotationMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN74251'->can('new') ? 'java::awt::event::ActionListener::AnonymousN74251'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN74251')
        });
        $self->{processingJMenu}->add($self->{generateRotationMenuItem});
        $self->{createStripImageJMenuItem}->setText("Multi Image Unifier");
        $self->{createStripImageJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN74475 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->createStripImageJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN74475'->can('new') ? 'java::awt::event::ActionListener::AnonymousN74475'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN74475')
        });
        $self->{processingJMenu}->add($self->{createStripImageJMenuItem});
        $self->{mirrorJMenuItem}->setText("Mirror Image(s)");
        $self->{mirrorJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN74699 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->mirrorJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN74699'->can('new') ? 'java::awt::event::ActionListener::AnonymousN74699'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN74699')
        });
        $self->{processingJMenu}->add($self->{mirrorJMenuItem});
        $self->{scaleImagesJMenuItem}->setText("Scale Image(s)");
        $self->{scaleImagesJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN74923 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->scaleImagesJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN74923'->can('new') ? 'java::awt::event::ActionListener::AnonymousN74923'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN74923')
        });
        $self->{processingJMenu}->add($self->{scaleImagesJMenuItem});
        $self->{canvasImagesJMenuItem}->setText("Canvas Image(s)");
        $self->{canvasImagesJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN75147 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->canvasImagesJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN75147'->can('new') ? 'java::awt::event::ActionListener::AnonymousN75147'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN75147')
        });
        $self->{processingJMenu}->add($self->{canvasImagesJMenuItem});
        $self->{createIconImagesJMenuItem}->setText("Create Icon Image(s)");
        $self->{createIconImagesJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN75371 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->createIconsJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN75371'->can('new') ? 'java::awt::event::ActionListener::AnonymousN75371'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN75371')
        });
        $self->{processingJMenu}->add($self->{createIconImagesJMenuItem});
        $self->{mainJMenuBar}->add($self->{processingJMenu});
        $self->setJMenuBar($self->{mainJMenuBar});
        $self->pack();
}


sub createStripImageJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            my $imageUnifierJPanel = 'org::allbinary::image::gui::ImageUnifierJPanel'->new($self->{imageProcessorInput});
            $self->{jPanel1}->removeAll();
            $self->{jPanel1}->add($imageUnifierJPanel);
            $self->{jPanel1}->updateUI();
            $org::allbinary::image::gui::ImageToolJFrame::imageProcessorInputCompositeInterface = $imageUnifierJPanel;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "createStripImageJMenuItemActionPerformed", $e);
        }
}


sub okJButtonActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->{logUtil}->putF("Starting", $self, "okJButtonActionPerformed");
            my $imageAnalysisResultsArray = 'org::allbinary::media::image::analysis::ImageAnalysis'->getInstance()->process($self->{imageProcessorInput}->getBufferedImageArray(), $self->getColorRangeInterface());
            $self->{jPanel1}->removeAll();
            $self->{jPanel1}->add('org::allbinary::image::gui::ImageAnalysisResultsJPanel'->new($imageAnalysisResultsArray));
            $self->{jPanel1}->updateUI();
            $self->{analysisActionJDialog}->setVisible(0);
            $org::allbinary::image::gui::ImageToolJFrame::imageProcessorInputCompositeInterface = undef;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "okJButtonActionPerformed", $e);
        }
}


sub processingJMenuActionPerformed {
    my ($self, $evt) = @_;
}


sub openImageJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->{logUtil}->putF("Starting", $self, "openImageJMenuItemActionPerformed");
            $self->{fileJDialog}->setVisible(1);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "openImageJMenuItemActionPerformed", $e);
        }
}


sub onFiles {
    my ($self, $files) = @_;
        try {
            $self->{logUtil}->putF("Reading " . scalar(@{$files}) . " files.", $self, "onFiles");
            'java::util::Arrays'->sort($files, do {
                package java::util::Comparator::AnonymousN76930 { our @ISA = ('java::util::Comparator');
                

                sub compare {
                    my ($self, $file1, $file2) = @_;
                    my $fileNameIndexValue1 = $self->extractIndexNumberIfAnyFromFileName($file1->getName());
                    my $fileNameIndexValue2 = $self->extractIndexNumberIfAnyFromFileName($file2->getName());
                    return $fileNameIndexValue1 - $fileNameIndexValue2;
                }
                

                sub extractIndexNumberIfAnyFromFileName {
                    my ($self, $name) = @_;
                    my $i = 0;
                    try {
                        my $start = rindex($name, "_") + 1;
                        my $end = rindex($name, ".");
                        my $number = substr($name, $start, ($end) - ($start));
                        $i = int($number);
                    } catch ($e) {
                        $i = 0;
                    }
                    return $i;
                }
                }
                'java::util::Comparator::AnonymousN76930'->can('new') ? 'java::util::Comparator::AnonymousN76930'->new() : bless({}, 'java::util::Comparator::AnonymousN76930')
            });
            my $bufferedImageArray = [(undef) x (scalar(@{$files}))];
            for (my $index = 0; $index < scalar(@{$files}); $index++) {
                $bufferedImageArray->[$index] = 'javax::imageio::ImageIO'->read($files->[$index]);
                if (!defined($bufferedImageArray->[$index])) {
                    die ("Unable to read file: " . $files->[$index]->getPath());
                }
            }
            $self->{imageProcessorInput} = 'org::allbinary::media::image::ImageProcessorInput'->new($files, $bufferedImageArray);
            $self->{fileJDialog}->setVisible(0);
            if (defined($org::allbinary::image::gui::ImageToolJFrame::imageProcessorInputCompositeInterface)) {
                $org::allbinary::image::gui::ImageToolJFrame::imageProcessorInputCompositeInterface->setImageProcessorInput($self->{imageProcessorInput});
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "onFiles", $e);
        }
}


sub fileJMenuActionPerformed {
    my ($self, $evt) = @_;
}


sub analyzeJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->{logUtil}->putF("Starting", $self, "analyzeJMenuItemActionPerformed");
            $self->{analysisActionJDialog}->setVisible(1);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "analyzeJMenuItemActionPerformed", $e);
        }
}


sub generateRotationSpriteJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->{logUtil}->putF("Starting", $self, "generateRotationSpriteJMenuItemActionPerformed");
            my $spriteImageJPanel = 'org::allbinary::image::gui::RotationSpriteImageJPanel'->new($self->{imageProcessorInput});
            $self->{jPanel1}->removeAll();
            $self->{jPanel1}->add($spriteImageJPanel);
            $self->{jPanel1}->updateUI();
            $org::allbinary::image::gui::ImageToolJFrame::imageProcessorInputCompositeInterface = $spriteImageJPanel;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "generateRotationSpriteJMenuItemActionPerformed", $e);
        }
}


sub generateSpriteSplitterMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->{logUtil}->putF("Starting", $self, "generateRotationSpriteJMenuItemActionPerformed");
            my $imageJPanel = 'org::allbinary::image::gui::SpriteSplitterImageJPanel'->new($self->{imageProcessorInput});
            $self->{jPanel1}->removeAll();
            $self->{jPanel1}->add($imageJPanel);
            $self->{jPanel1}->updateUI();
            $org::allbinary::image::gui::ImageToolJFrame::imageProcessorInputCompositeInterface = $imageJPanel;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "generateRotationMenuItemActionPerformed", $e);
        }
}


sub generateRotationMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->{logUtil}->putF("Starting", $self, "generateRotationSpriteJMenuItemActionPerformed");
            my $rotationImageJPanel = 'org::allbinary::image::gui::RotationImageJPanel'->new($self->{imageProcessorInput});
            $self->{jPanel1}->removeAll();
            $self->{jPanel1}->add($rotationImageJPanel);
            $self->{jPanel1}->updateUI();
            $org::allbinary::image::gui::ImageToolJFrame::imageProcessorInputCompositeInterface = $rotationImageJPanel;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "generateRotationMenuItemActionPerformed", $e);
        }
}


sub scaleImagesJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "scaleImagesJMenuItemActionPerformed");
            my $resizeImageJPanel = 'org::allbinary::image::gui::ResizeImageJPanel'->new($self->{imageProcessorInput});
            $self->{jPanel1}->removeAll();
            $self->{jPanel1}->add($resizeImageJPanel);
            $self->{jPanel1}->updateUI();
            $org::allbinary::image::gui::ImageToolJFrame::imageProcessorInputCompositeInterface = $resizeImageJPanel;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "scaleImagesJMenuItemActionPerformed", $e);
        }
}


sub createIconsJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "createIconsJMenuItemActionPerformed");
            my $createIconImagesJPanel = 'org::allbinary::image::gui::CreateIconImagesJPanel'->new($self->{imageProcessorInput});
            $self->{jPanel1}->removeAll();
            $self->{jPanel1}->add($createIconImagesJPanel);
            $self->{jPanel1}->updateUI();
            $org::allbinary::image::gui::ImageToolJFrame::imageProcessorInputCompositeInterface = $createIconImagesJPanel;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "scaleImagesJMenuItemActionPerformed", $e);
        }
}


sub canvasImagesJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "canvasImagesJMenuItemActionPerformed");
            my $resizeImageJPanel = 'org::allbinary::image::gui::CanvasImageJPanel'->new($self->{imageProcessorInput});
            $self->{jPanel1}->removeAll();
            $self->{jPanel1}->add($resizeImageJPanel);
            $self->{jPanel1}->updateUI();
            $org::allbinary::image::gui::ImageToolJFrame::imageProcessorInputCompositeInterface = $resizeImageJPanel;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "scaleImagesJMenuItemActionPerformed", $e);
        }
}


sub generateMirrorSpriteMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->{logUtil}->putF("Starting", $self, "generateMirrorSpriteJMenuItemActionPerformed");
            my $spriteImageJPanel = 'org::allbinary::image::gui::MirrorSpriteImageJPanel'->new($self->{imageProcessorInput});
            $self->{jPanel1}->removeAll();
            $self->{jPanel1}->add($spriteImageJPanel);
            $self->{jPanel1}->updateUI();
            $org::allbinary::image::gui::ImageToolJFrame::imageProcessorInputCompositeInterface = $spriteImageJPanel;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "generateMirrorSpriteJMenuItemActionPerformed", $e);
        }
}


sub mirrorJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->{logUtil}->putF("Starting", $self, "generateMirrorJMenuItemActionPerformed");
            my $mirrorImageJPanel = 'org::allbinary::image::gui::MirrorImageJPanel'->new($self->{imageProcessorInput});
            $self->{jPanel1}->removeAll();
            $self->{jPanel1}->add($mirrorImageJPanel);
            $self->{jPanel1}->updateUI();
            $org::allbinary::image::gui::ImageToolJFrame::imageProcessorInputCompositeInterface = $mirrorImageJPanel;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "generateMirrorJMenuItemActionPerformed", $e);
        }
}


sub getColorRangeInterface {
    my ($self) = @_;
        my $colorRangeInterface = 'org::allbinary::media::image::analysis::ColorRange'->new();
        $colorRangeInterface->setMinRed(int($self->getMinRedJTextField()->getText()));
        $colorRangeInterface->setMaxRed(int($self->getMaxRedJTextField()->getText()));
        $colorRangeInterface->setMinGreen(int($self->getMinGreenJTextField()->getText()));
        $colorRangeInterface->setMaxGreen(int($self->getMaxGreenJTextField()->getText()));
        $colorRangeInterface->setMinBlue(int($self->getMinBlueJTextField()->getText()));
        $colorRangeInterface->setMaxBlue(int($self->getMaxBlueJTextField()->getText()));
        return $colorRangeInterface;
}


sub getMaxBlueJTextField {
    my ($self) = @_;
        return $self->{maxBlueJTextField};
}


sub setMaxBlueJTextField {
    my ($self, $maxBlueJTextField) = @_;
        $self->{maxBlueJTextField} = $self->{maxBlueJTextField};
}


sub getMaxGreenJTextField {
    my ($self) = @_;
        return $self->{maxGreenJTextField};
}


sub setMaxGreenJTextField {
    my ($self, $maxGreenJTextField) = @_;
        $self->{maxGreenJTextField} = $self->{maxGreenJTextField};
}


sub getMaxRedJTextField {
    my ($self) = @_;
        return $self->{maxRedJTextField};
}


sub setMaxRedJTextField {
    my ($self, $maxRedJTextField) = @_;
        $self->{maxRedJTextField} = $self->{maxRedJTextField};
}


sub getMinBlueJTextField {
    my ($self) = @_;
        return $self->{minBlueJTextField};
}


sub setMinBlueJTextField {
    my ($self, $minBlueJTextField) = @_;
        $self->{minBlueJTextField} = $self->{minBlueJTextField};
}


sub getMinGreenJTextField {
    my ($self) = @_;
        return $self->{minGreenJTextField};
}


sub setMinGreenJTextField {
    my ($self, $minGreenJTextField) = @_;
        $self->{minGreenJTextField} = $self->{minGreenJTextField};
}


sub getMinRedJTextField {
    my ($self) = @_;
        return $self->{minRedJTextField};
}


sub setMinRedJTextField {
    my ($self, $minRedJTextField) = @_;
        $self->{minRedJTextField} = $self->{minRedJTextField};
}

# use java::awt::image::BufferedImage;
use java::io::File;
# use java::util::Arrays;
# use java::util::Comparator;
# use javax::imageio::ImageIO;
use org::allbinary::gui::dialog::FileJDialog;
use org::allbinary::gui::dialog::FileJDialogListenerInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::media::image::ImageProcessorInput;
use org::allbinary::media::image::ImageProcessorInputCompositeInterface;
use org::allbinary::media::image::analysis::ColorRange;
use org::allbinary::media::image::analysis::ColorRangeInterface;
use org::allbinary::media::image::analysis::ImageAnalysis;
use org::allbinary::media::image::analysis::ImageAnalysisResults;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonStrings;
use org::allbinary::image::gui::ImageUnifierJPanel;
use org::allbinary::image::gui::ImageAnalysisResultsJPanel;
use org::allbinary::image::gui::RotationSpriteImageJPanel;
use org::allbinary::image::gui::SpriteSplitterImageJPanel;
use org::allbinary::image::gui::RotationImageJPanel;
use org::allbinary::image::gui::ResizeImageJPanel;
use org::allbinary::image::gui::CreateIconImagesJPanel;
use org::allbinary::image::gui::CanvasImageJPanel;
use org::allbinary::image::gui::MirrorSpriteImageJPanel;
use org::allbinary::image::gui::MirrorImageJPanel;

1;

