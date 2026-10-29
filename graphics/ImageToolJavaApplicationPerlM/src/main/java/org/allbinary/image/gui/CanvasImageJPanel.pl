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

package org::allbinary::image::gui::CanvasImageJPanel;
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
    $self->{heightReductionTextField1} = undef;
    $self->{jLabel4} = undef;
    $self->{jLabel5} = undef;
    $self->{jLabel6} = undef;
    $self->{jLabel7} = undef;
    $self->{jLabel8} = undef;
    $self->{jPanel1} = undef;
    $self->{jPanel2} = undef;
    $self->{widthReductionTextField} = undef;
    $self->{widthReductionTextField1} = undef;
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
            package java::lang::Thread::AnonymousN66452 { our @ISA = ('java::lang::Thread');
            

            sub run {
                my ($self) = @_;
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                try {
                    my $canvasTrimUtil = 'org::allbinary::media::image::CanvasTrimUtil'->getInstance();
                    my $canvasExpandUtil = 'org::allbinary::media::image::CanvasExpandUtil'->getInstance();
                    my $leftReduction = ("" . ($self->{widthReductionTextField1}->getText()));
                    my $topReduction = ("" . ($self->{heightReductionTextField1}->getText()));
                    my $widthReduction = ("" . ($self->{widthReductionTextField}->getText()));
                    my $heightReduction = ("" . ($self->{heightReductionTextField}->getText()));
                    if ($leftReduction <= 0 || $topReduction <= 0 || $widthReduction <= 0 || $heightReduction <= 0) {
                        $canvasTrimUtil->process($self->getImageProcessorInput(), -$leftReduction, -$topReduction, -$widthReduction, -$heightReduction, $self);
                    } else {
                        $canvasExpandUtil->process($self->getImageProcessorInput(), $leftReduction, $topReduction, $self);
                    }
                } catch ($e) {
                    $logUtil->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
                }
            }
            }
            'java::lang::Thread::AnonymousN66452'->can('new') ? 'java::lang::Thread::AnonymousN66452'->new() : bless({}, 'java::lang::Thread::AnonymousN66452')
        }->start();
}


sub initComponents {
    my ($self) = @_;
        $self->{writeOverOriginalJCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{jPanel1} = do {
            package javax::swing::JPanel::AnonymousN67366 { our @ISA = ('javax::swing::JPanel');
            

            sub paint {
                my ($self, $graphics) = @_;
                if (defined($self->{result})) {
                    $graphics->drawImage($self->{result}, 0, 0, $self->{result}->getWidth(undef), $self->{result}->getHeight(undef), undef);
                }
            }
            }
            'javax::swing::JPanel::AnonymousN67366'->can('new') ? 'javax::swing::JPanel::AnonymousN67366'->new() : bless({}, 'javax::swing::JPanel::AnonymousN67366')
        };
        $self->{generateJButton} = 'javax::swing::JButton'->new();
        $self->{jLabel4} = 'javax::swing::JLabel'->new();
        $self->{jPanel2} = 'javax::swing::JPanel'->new();
        $self->{jLabel5} = 'javax::swing::JLabel'->new();
        $self->{widthReductionTextField} = 'javax::swing::JTextField'->new();
        $self->{jLabel6} = 'javax::swing::JLabel'->new();
        $self->{heightReductionTextField} = 'javax::swing::JTextField'->new();
        $self->{widthReductionTextField1} = 'javax::swing::JTextField'->new();
        $self->{jLabel7} = 'javax::swing::JLabel'->new();
        $self->{jLabel8} = 'javax::swing::JLabel'->new();
        $self->{heightReductionTextField1} = 'javax::swing::JTextField'->new();
        $self->{writeOverOriginalJCheckBox}->setSelected(1);
        $self->{writeOverOriginalJCheckBox}->setText("Write Over Original");
        $self->{writeOverOriginalJCheckBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68200 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->writeOverOriginalJCheckBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68200'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68200'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68200')
        });
        my $jPanel1Layout = 'javax::swing::GroupLayout'->new($self->{jPanel1});
        $self->{jPanel1}->setLayout($jPanel1Layout);
        $jPanel1Layout->setHorizontalGroup($jPanel1Layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 0, 32767));
        $jPanel1Layout->setVerticalGroup($jPanel1Layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 196, 32767));
        $self->{generateJButton}->setText("Generate");
        $self->{generateJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68740 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->generateJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68740'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68740'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68740')
        });
        $self->{jLabel4}->setText("Results:");
        $self->{jLabel5}->setText("Right:");
        $self->{widthReductionTextField}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        $self->{widthReductionTextField}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69007 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->widthReductionTextFieldActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69007'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69007'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69007')
        });
        $self->{jLabel6}->setText("Bottom");
        $self->{heightReductionTextField}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        $self->{widthReductionTextField1}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        $self->{widthReductionTextField1}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69294 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->widthReductionTextField1ActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69294'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69294'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69294')
        });
        $self->{jLabel7}->setText("Top");
        $self->{jLabel8}->setText("Left:");
        $self->{heightReductionTextField1}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        my $jPanel2Layout = 'javax::swing::GroupLayout'->new($self->{jPanel2});
        $self->{jPanel2}->setLayout($jPanel2Layout);
        $jPanel2Layout->setHorizontalGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($jPanel2Layout->createSequentialGroup()->addContainerGap()->addComponent($self->{jLabel8})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{widthReductionTextField1}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 41, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jLabel5})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{widthReductionTextField}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 41, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jLabel7})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{heightReductionTextField1}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 46, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jLabel6})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{heightReductionTextField}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 46, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addContainerGap(140, 32767)));
        $jPanel2Layout->setVerticalGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $jPanel2Layout->createSequentialGroup()->addGap(0, 16, 32767)->addGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel6})->addComponent($self->{heightReductionTextField}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel8})->addComponent($self->{widthReductionTextField1}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 22, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{jLabel7})->addComponent($self->{heightReductionTextField1}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel5})->addComponent($self->{widthReductionTextField}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 22, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})))));
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jPanel2}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addGap(78, 78, 78))->addGroup($layout->createSequentialGroup()->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addContainerGap()->addComponent($self->{jPanel1}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767))->addGroup($layout->createSequentialGroup()->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{jLabel4})->addGroup($layout->createSequentialGroup()->addComponent($self->{writeOverOriginalJCheckBox})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{generateJButton})))->addGap(0, 0, 32767)))->addContainerGap()));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jPanel2}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{generateJButton})->addComponent($self->{writeOverOriginalJCheckBox}))->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jLabel4})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jPanel1}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)));
}


sub writeOverOriginalJCheckBoxActionPerformed {
    my ($self, $evt) = @_;
}


sub generateJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->process();
}


sub widthReductionTextFieldActionPerformed {
    my ($self, $evt) = @_;
}


sub widthReductionTextField1ActionPerformed {
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
use org::allbinary::media::image::CanvasExpandUtil;
use org::allbinary::media::image::CanvasTrimUtil;
use org::allbinary::media::image::ImageProcessedVisitor;
use org::allbinary::media::image::ImageProcessorInput;
use org::allbinary::media::image::ImageStrings;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use java::lang::Thread;

1;

