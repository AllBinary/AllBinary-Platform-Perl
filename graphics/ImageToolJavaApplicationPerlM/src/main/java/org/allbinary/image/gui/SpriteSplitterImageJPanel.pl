# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::image::gui::SpriteSplitterImageJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel','org::allbinary::media::image::ImageProcessedVisitor';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{imageStrings} = 'org::allbinary::media::image::ImageStrings'->getInstance();
    $self->{imageProcessorInput} = undef;
    $self->{result} = undef;
    $self->{generateJButton} = undef;
    $self->{heightReductionTextField} = undef;
    $self->{increaseHeightTextField} = undef;
    $self->{increaseWidthTextField} = undef;
    $self->{jLabel1} = undef;
    $self->{jLabel2} = undef;
    $self->{jLabel3} = undef;
    $self->{jLabel4} = undef;
    $self->{jLabel5} = undef;
    $self->{jLabel6} = undef;
    $self->{jLabel7} = undef;
    $self->{jLabel8} = undef;
    $self->{jPanel1} = undef;
    $self->{jPanel2} = undef;
    $self->{spriteTypeJComboBox} = undef;
    $self->{totalAnimationsJComboBox} = undef;
    $self->{totalFramesJComboBox} = undef;
    $self->{widthReductionTextField} = undef;
    $self->{writeOverOriginalJCheckBox} = undef;
}


sub new {
    my ($class, $imageProcessorInput) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->initComponents();
        $self->{imageProcessorInput} = $imageProcessorInput;
    return $self;
}


sub process {
    my ($self) = @_;
        do {
            package java::lang::Thread::AnonymousN66422 { our @ISA = ('java::lang::Thread');
            

            sub run {
                my ($self) = @_;
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                try {
                    my $spriteSplitterUtil = 'org::allbinary::media::image::SpriteSplitterUtil'->getInstance();
                    my $spriteType = $self->{spriteTypeJComboBox}->getSelectedItem();
                    my $totalFrames = ("" . ($self->{totalFramesJComboBox}->getSelectedItem()));
                    my $totalAnimations = ("" . ($self->{totalAnimationsJComboBox}->getSelectedItem()));
                    my $widthReduction = ("" . ($self->{widthReductionTextField}->getText()));
                    my $heightReduction = ("" . ($self->{heightReductionTextField}->getText()));
                    my $increaseWidth = ("" . ($self->{increaseWidthTextField}->getText()));
                    my $increaseHeight = ("" . ($self->{increaseHeightTextField}->getText()));
                    $spriteSplitterUtil->process($self->getImageProcessorInput(), $totalFrames, $totalAnimations, $widthReduction, $heightReduction, $increaseWidth, $increaseHeight, $spriteType, $self);
                } catch ($e) {
                    $logUtil->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
                }
            }
            }
            'java::lang::Thread::AnonymousN66422'->can('new') ? 'java::lang::Thread::AnonymousN66422'->new() : bless({}, 'java::lang::Thread::AnonymousN66422')
        }->start();
}


sub initComponents {
    my ($self) = @_;
        $self->{writeOverOriginalJCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{widthReductionTextField} = 'javax::swing::JTextField'->new();
        $self->{jLabel5} = 'javax::swing::JLabel'->new();
        $self->{jPanel1} = do {
            package javax::swing::JPanel::AnonymousN67446 { our @ISA = ('javax::swing::JPanel');
            

            sub paint {
                my ($self, $graphics) = @_;
                if (defined($self->{result})) {
                    $graphics->drawImage($self->{result}, 0, 0, $self->{result}->getWidth(undef), $self->{result}->getHeight(undef), undef);
                }
            }
            }
            'javax::swing::JPanel::AnonymousN67446'->can('new') ? 'javax::swing::JPanel::AnonymousN67446'->new() : bless({}, 'javax::swing::JPanel::AnonymousN67446')
        };
        $self->{jLabel4} = 'javax::swing::JLabel'->new();
        $self->{jLabel6} = 'javax::swing::JLabel'->new();
        $self->{heightReductionTextField} = 'javax::swing::JTextField'->new();
        $self->{generateJButton} = 'javax::swing::JButton'->new();
        $self->{jPanel2} = 'javax::swing::JPanel'->new();
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{totalFramesJComboBox} = 'javax::swing::JComboBox'->new();
        my $size = 70;
        my $animationStringArray2 = [(undef) x ($size - 1)];
        for (my $index = 1; $index < $size; $index++) {
            $animationStringArray2->[$index - 1] = ("" . ($index));
        }
        $self->{totalFramesJComboBox}->setModel('javax::swing::DefaultComboBoxModel'->new($animationStringArray2));
        $self->{jLabel2} = 'javax::swing::JLabel'->new();
        $self->{totalAnimationsJComboBox} = 'javax::swing::JComboBox'->new();
        my $animationStringArray = [(undef) x ($size - 1)];
        for (my $index = 1; $index < $size; $index++) {
            $animationStringArray->[$index - 1] = ("" . ($index));
        }
        $self->{totalAnimationsJComboBox}->setModel('javax::swing::DefaultComboBoxModel'->new($animationStringArray));
        $self->{jLabel3} = 'javax::swing::JLabel'->new();
        $self->{spriteTypeJComboBox} = 'javax::swing::JComboBox'->new();
        $self->{spriteTypeJComboBox}->setModel('javax::swing::DefaultComboBoxModel'->new([$org::allbinary::image::gui::org::allbinary->{media}->{image}->{SpriteSplitterUtil}->getInstance()->{DIRECTIONAL_ANIMATIONS}, $org::allbinary::image::gui::org::allbinary->{media}->{image}->{SpriteSplitterUtil}->getInstance()->{HORIZONTAL_ANIMATIONS}, $org::allbinary::image::gui::org::allbinary->{media}->{image}->{SpriteSplitterUtil}->getInstance()->{HORIZONTAL_SPRITE}]));
        $self->{jLabel7} = 'javax::swing::JLabel'->new();
        $self->{increaseWidthTextField} = 'javax::swing::JTextField'->new();
        $self->{jLabel8} = 'javax::swing::JLabel'->new();
        $self->{increaseHeightTextField} = 'javax::swing::JTextField'->new();
        $self->{writeOverOriginalJCheckBox}->setText("Write Over Original");
        $self->{writeOverOriginalJCheckBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69291 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->writeOverOriginalJCheckBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69291'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69291'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69291')
        });
        $self->{widthReductionTextField}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        $self->{widthReductionTextField}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69498 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->widthReductionTextFieldActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69498'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69498'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69498')
        });
        $self->{jLabel5}->setText("Less Width:");
        $self->{jLabel4}->setText("Results:");
        my $jPanel1Layout = 'javax::swing::GroupLayout'->new($self->{jPanel1});
        $self->{jPanel1}->setLayout($jPanel1Layout);
        $jPanel1Layout->setHorizontalGroup($jPanel1Layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($jPanel1Layout->createSequentialGroup()->addComponent($self->{jLabel4})->addGap(0, 0, 32767)));
        $jPanel1Layout->setVerticalGroup($jPanel1Layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($jPanel1Layout->createSequentialGroup()->addComponent($self->{jLabel4})->addGap(0, 184, 32767)));
        $self->{jLabel6}->setText("Less Height:");
        $self->{heightReductionTextField}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        $self->{generateJButton}->setText("Generate");
        $self->{generateJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70270 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->generateJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70270'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70270'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70270')
        });
        $self->{jLabel1}->setText("Row Total:");
        $self->{totalFramesJComboBox}->setSelectedIndex(1);
        $self->{totalFramesJComboBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70487 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->totalFramesJComboBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70487'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70487'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70487')
        });
        $self->{jLabel2}->setText("Column Total :");
        $self->{totalAnimationsJComboBox}->setSelectedIndex(3);
        $self->{totalAnimationsJComboBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70704 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->totalAnimationsJComboBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70704'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70704'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70704')
        });
        $self->{jLabel3}->setText("Type:");
        $self->{spriteTypeJComboBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70891 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->spriteTypeJComboBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70891'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70891'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70891')
        });
        my $jPanel2Layout = 'javax::swing::GroupLayout'->new($self->{jPanel2});
        $self->{jPanel2}->setLayout($jPanel2Layout);
        $jPanel2Layout->setHorizontalGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $jPanel2Layout->createSequentialGroup()->addContainerGap()->addComponent($self->{jLabel1})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{totalFramesJComboBox}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 48, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jLabel2})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{totalAnimationsJComboBox}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 39, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jLabel3})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{spriteTypeJComboBox}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 172, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addContainerGap($org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)));
        $jPanel2Layout->setVerticalGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($jPanel2Layout->createSequentialGroup()->addContainerGap($org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel1})->addComponent($self->{totalFramesJComboBox}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{jLabel2})->addComponent($self->{totalAnimationsJComboBox}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{jLabel3})->addComponent($self->{spriteTypeJComboBox}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))));
        $self->{jLabel7}->setText("More Width:");
        $self->{increaseWidthTextField}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        $self->{increaseWidthTextField}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72676 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->increaseWidthTextFieldActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72676'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72676'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72676')
        });
        $self->{jLabel8}->setText("More Height:");
        $self->{increaseHeightTextField}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jPanel2}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 415, 32767)->addGap(78, 78, 78))->addGroup($layout->createSequentialGroup()->addContainerGap()->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{jPanel1}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addGroup($layout->createSequentialGroup()->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{writeOverOriginalJCheckBox})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{generateJButton}))->addGroup($layout->createSequentialGroup()->addComponent($self->{jLabel5})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{widthReductionTextField}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 41, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jLabel6})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{heightReductionTextField}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 46, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jLabel7})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{increaseWidthTextField}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 41, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jLabel8})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{increaseHeightTextField}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 46, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})))->addGap(0, 0, 32767)))->addContainerGap()));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jPanel2}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel7})->addComponent($self->{increaseWidthTextField}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 22, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{jLabel8})->addComponent($self->{increaseHeightTextField}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel5})->addComponent($self->{widthReductionTextField}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 22, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{jLabel6})->addComponent($self->{heightReductionTextField}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})))->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{writeOverOriginalJCheckBox})->addComponent($self->{generateJButton}))->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jPanel1}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)));
}


sub writeOverOriginalJCheckBoxActionPerformed {
    my ($self, $evt) = @_;
}


sub generateJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->process();
}


sub spriteTypeJComboBoxActionPerformed {
    my ($self, $evt) = @_;
        my $spriteSplitterUtil = 'org::allbinary::media::image::SpriteSplitterUtil'->getInstance();
        $self->{jLabel1}->setText($spriteSplitterUtil->{ANIMATIONS_LABELS}->[$self->{spriteTypeJComboBox}->getSelectedIndex()]);
        $self->{jLabel2}->setText($spriteSplitterUtil->{ANIMATIONS_LABELS}->[$self->{spriteTypeJComboBox}->getSelectedIndex() + 1]);
}


sub totalAnimationsJComboBoxActionPerformed {
    my ($self, $evt) = @_;
}


sub totalFramesJComboBoxActionPerformed {
    my ($self, $evt) = @_;
}


sub widthReductionTextFieldActionPerformed {
    my ($self, $evt) = @_;
}


sub increaseWidthTextFieldActionPerformed {
    my ($self, $evt) = @_;
}


sub getImageProcessorInput {
    my ($self) = @_;
        return $self->{imageProcessorInput};
}


sub setImageProcessorInput {
    my ($self, $imageProcessorInput) = @_;
        $self->{imageProcessorInput} = $imageProcessorInput;
}


# throws IOException
sub visit {
    my ($self, $generatedBufferedImage, $name, $index) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{VISIT}, $self, $self->{commonStrings}->{VISIT});
        $self->{result} = $generatedBufferedImage;
        $self->getParent()->repaint();
        my $file = $self->{imageProcessorInput}->getFiles()->[$index];
        if (!$self->{writeOverOriginalJCheckBox}->isSelected()) {
            my $filePath = $file->getAbsolutePath();
            my $extensionIndex = index($filePath, $self->{imageStrings}->{PNG_EXTENSION});
            $filePath = 'org::allbinary::logic::string::StringMaker'->new()->append(substr($filePath, 0, ($extensionIndex) - (0)))->append($self->{commonSeps}->{UNDERSCORE})->append($name)->append($self->{imageStrings}->{PNG_EXTENSION})->toString();
            $file = 'java::io::File'->new($filePath);
        }
        my $isWritten = 'javax::imageio::ImageIO'->write($self->{result}, $self->{imageStrings}->{PNG}, $file);
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("File: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($file))->append(" Wrote: ")->appendboolean($isWritten)->toString(), $self, $self->{commonStrings}->{RUN});
}

# use java::awt;
# use java::awt::image::BufferedImage;
# use java::awt::image::RenderedImage;
use java::io::File;
# use java::io::IOException;
# use javax::imageio::ImageIO;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::image::ImageProcessedVisitor;
use org::allbinary::media::image::ImageProcessorInput;
use org::allbinary::media::image::ImageStrings;
use org::allbinary::media::image::SpriteSplitterUtil;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use java::lang::Thread;

1;

