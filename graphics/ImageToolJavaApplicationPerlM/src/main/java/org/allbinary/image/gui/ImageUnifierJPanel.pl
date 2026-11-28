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

package org::allbinary::image::gui::ImageUnifierJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::media::image::ImageProcessorInputCompositeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{imageStrings} = 'org::allbinary::media::image::ImageStrings'->getInstance();
    $self->{imagesRatioUtil} = 'org::allbinary::media::image::ImagesRatioUtil'->getInstance();
    $self->{imageProcessorInput} = undef unless exists $self->{imageProcessorInput};
    $self->{icon} = undef unless exists $self->{icon};
    $self->{imageUnifierProperties} = undef unless exists $self->{imageUnifierProperties};
    $self->{result} = undef unless exists $self->{result};
    $self->{isImageFillIn} = 1;
    $self->{avgRatioJTextField} = undef unless exists $self->{avgRatioJTextField};
    $self->{cellHeightJTextField} = undef unless exists $self->{cellHeightJTextField};
    $self->{cellRatioJTextField} = undef unless exists $self->{cellRatioJTextField};
    $self->{cellWidthJTextField} = undef unless exists $self->{cellWidthJTextField};
    $self->{columnsJTextField} = undef unless exists $self->{columnsJTextField};
    $self->{downJButton} = undef unless exists $self->{downJButton};
    $self->{fudgeItJButton} = undef unless exists $self->{fudgeItJButton};
    $self->{imageJList} = undef unless exists $self->{imageJList};
    $self->{jButton1} = undef unless exists $self->{jButton1};
    $self->{jButton2} = undef unless exists $self->{jButton2};
    $self->{jButtonOrder} = undef unless exists $self->{jButtonOrder};
    $self->{jLabel1} = undef unless exists $self->{jLabel1};
    $self->{jLabel2} = undef unless exists $self->{jLabel2};
    $self->{jLabel3} = undef unless exists $self->{jLabel3};
    $self->{jLabel4} = undef unless exists $self->{jLabel4};
    $self->{jLabel5} = undef unless exists $self->{jLabel5};
    $self->{jLabel6} = undef unless exists $self->{jLabel6};
    $self->{jPanel1} = undef unless exists $self->{jPanel1};
    $self->{jScrollPane1} = undef unless exists $self->{jScrollPane1};
    $self->{jScrollPane2} = undef unless exists $self->{jScrollPane2};
    $self->{rowsJTextField} = undef unless exists $self->{rowsJTextField};
    $self->{upJButton} = undef unless exists $self->{upJButton};
}


sub new {
    my ($class, $imageProcessorInput) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->initComponents();
        $self->setImageProcessorInput($imageProcessorInput);
    return $self;
}


sub init {
    my ($self) = @_;
        try {
            my $imageProcessorInput = $self->getImageProcessorInput();
            my $bufferedImageArray = $imageProcessorInput->getBufferedImageArray();
            $self->{icon} = [(undef) x (scalar(@{$bufferedImageArray}))];
            my $defaultListModel = 'javax::swing::DefaultListModel'->new();
            for (my $index = 0; $index < scalar(@{$bufferedImageArray}); $index++) {
                my $width = $bufferedImageArray->[$index]->getWidth();
                my $height = $bufferedImageArray->[$index]->getHeight();
                my $newWidth = 52;
                my $oldRatio = $width / $height;
                my $newHeight = int(($newWidth / $oldRatio));
                my $iconBufferedImage = 'org::allbinary::media::image::ImageUtil'->getInstance()->createBufferedImage($bufferedImageArray->[$index], $newWidth, $newHeight, 1);
                $self->{icon}->[$index] = 'org::allbinary::image::gui::ImageIconUnique'->new($iconBufferedImage, $index);
                $defaultListModel->addElement($self->{icon}->[$index]);
            }
            $self->{imageJList}->setModel($defaultListModel);
            $self->updateOnPropertiesChange();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{INIT}, $e);
        }
}


sub updateImage_j0 {
    my ($self) = @_;
        try {
            my $bufferedImageArray = $self->getImageProcessorInput()->getBufferedImageArray();
            my $tempBufferedImageArray = [(undef) x (scalar(@{$bufferedImageArray}))];
            for (my $index = 0; $index < scalar(@{$bufferedImageArray}); $index++) {
                my $indexedImageIcon = $self->{imageJList}->getModel()->getElementAt($index);
                my $bufferedImage = 'org::allbinary::media::image::ImageUtil'->getInstance()->createBufferedImage($bufferedImageArray->[$indexedImageIcon->getId()], $self->{imageUnifierProperties}->getImageUnifierCell()->getWidth(), $self->{imageUnifierProperties}->getImageUnifierCell()->getHeight(), 0);
                $tempBufferedImageArray->[$index] = $bufferedImage;
            }
            my $totalImages = $self->{imageUnifierProperties}->getRows() * $self->{imageUnifierProperties}->getColumns();
            my $averageRatio = $self->{imagesRatioUtil}->getAverage($tempBufferedImageArray, $totalImages);
            my $averageRatioString = $averageRatio->toString();
            if (length($averageRatioString) > 4) {
                $averageRatioString = substr($averageRatioString, 0, (4) - (0));
            }
            $self->{avgRatioJTextField}->setText($averageRatioString);
            $self->{fudgeItJButton}->setEnabled(0);
            if (!$self->{imagesRatioUtil}->isEqual($tempBufferedImageArray, $totalImages)) {
                if ($self->{isImageFillIn}) {
                    $self->{fudgeItJButton}->setEnabled(1);
                }
            }
            $self->updateImage($tempBufferedImageArray);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "updateImage", $e);
        }
}


sub updateImageWithFudgedImages {
    my ($self) = @_;
        try {
            my $bufferedImageArray = $self->getImageProcessorInput()->getBufferedImageArray();
            my $tempBufferedImageArray = [(undef) x (scalar(@{$bufferedImageArray}))];
            for (my $index = 0; $index < scalar(@{$bufferedImageArray}); $index++) {
                my $indexedImageIcon = $self->{imageJList}->getModel()->getElementAt($index);
                my $bufferedImage = 'org::allbinary::media::image::ImageUtil'->getInstance()->createBufferedImage($bufferedImageArray->[$indexedImageIcon->getId()], $self->{imageUnifierProperties}->getImageUnifierCell()->getWidth(), $self->{imageUnifierProperties}->getImageUnifierCell()->getHeight(), 0);
                $tempBufferedImageArray->[$index] = $bufferedImage;
            }
            my $totalImages = $self->{imageUnifierProperties}->getRows() * $self->{imageUnifierProperties}->getColumns();
            my $averageRatio = $self->{imagesRatioUtil}->getAverage($tempBufferedImageArray, $totalImages);
            my $fudgedBufferedImageArray = $self->{imagesRatioUtil}->fudge($tempBufferedImageArray, $totalImages, $averageRatio);
            $self->updateImage($fudgedBufferedImageArray);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "updateImageWithFudgedImages", $e);
        }
}


sub updateImage_j1 {
    my ($self, $tempBufferedImageArray) = @_;
        $self->{result} = 'org::allbinary::media::image::ImageUnifierUtil'->getInstance()->getImage($tempBufferedImageArray, $self->{imageUnifierProperties});
        my $image = 'javax::swing::ImageIcon'->new($self->{result});
        my $label = 'javax::swing::JLabel'->new($image);
        $self->{jScrollPane2}->getViewport()->add($label);
        $self->updateUI();
}

sub updateImage {
    my ($invocant, @arguments) = @_;
    return $invocant->updateImage_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->updateImage_j1(@arguments) if scalar(@arguments) == 1;
    die "No method updateImage takes " . scalar(@arguments) . " arguments";
}


sub updateOnPropertiesChange {
    my ($self) = @_;
        if ($self->{rowsJTextField}->getText()->length() > 0 && $self->{columnsJTextField}->getText()->length() > 0 && $self->{cellWidthJTextField}->getText()->length() > 0 && $self->{cellHeightJTextField}->getText()->length() > 0) {
            $self->{imageUnifierProperties} = 'org::allbinary::media::image::ImageUnifierProperties'->new();
            $self->{imageUnifierProperties}->setRows($self->{rowsJTextField}->getText());
            $self->{imageUnifierProperties}->setColumns($self->{columnsJTextField}->getText());
            my $imageUnifierCell = 'org::allbinary::media::image::ImageUnifierCell'->new($self->{cellWidthJTextField}->getText(), $self->{cellHeightJTextField}->getText());
            $self->{imageUnifierProperties}->setImageUnifierCell($imageUnifierCell);
            my $cellRatio = ($imageUnifierCell->getWidth() / $imageUnifierCell->getHeight());
            my $cellRatioString = $cellRatio->toString();
            if (length($cellRatioString) > 4) {
                $cellRatioString = substr($cellRatioString, 0, (4) - (0));
            }
            $self->{cellRatioJTextField}->setText($cellRatioString);
            $self->updateImage();
        }
}


sub initComponents {
    my ($self) = @_;
        my $commonPhoneStrings = 'org::allbinary::string::CommonPhoneStrings'->getInstance();
        $self->{jScrollPane1} = 'javax::swing::JScrollPane'->new();
        $self->{imageJList} = 'javax::swing::JList'->new();
        $self->{jScrollPane2} = 'javax::swing::JScrollPane'->new();
        $self->{jPanel1} = 'javax::swing::JPanel'->new();
        $self->{jButton1} = 'javax::swing::JButton'->new();
        $self->{upJButton} = 'javax::swing::JButton'->new();
        $self->{downJButton} = 'javax::swing::JButton'->new();
        $self->{fudgeItJButton} = 'javax::swing::JButton'->new();
        $self->{jLabel2} = 'javax::swing::JLabel'->new();
        $self->{columnsJTextField} = 'javax::swing::JTextField'->new();
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{rowsJTextField} = 'javax::swing::JTextField'->new();
        $self->{jLabel3} = 'javax::swing::JLabel'->new();
        $self->{cellWidthJTextField} = 'javax::swing::JTextField'->new();
        $self->{jLabel4} = 'javax::swing::JLabel'->new();
        $self->{cellHeightJTextField} = 'javax::swing::JTextField'->new();
        $self->{jLabel5} = 'javax::swing::JLabel'->new();
        $self->{cellRatioJTextField} = 'javax::swing::JTextField'->new();
        $self->{jLabel6} = 'javax::swing::JLabel'->new();
        $self->{avgRatioJTextField} = 'javax::swing::JTextField'->new();
        $self->{jButton2} = 'javax::swing::JButton'->new();
        $self->{jButtonOrder} = 'javax::swing::JButton'->new();
        $self->setMinimumSize('java::awt::Dimension'->new(500, 375));
        $self->setPreferredSize('java::awt::Dimension'->new(0, 0));
        $self->{imageJList}->setMinimumSize('java::awt::Dimension'->new(50, 0));
        $self->{jScrollPane1}->setViewportView($self->{imageJList});
        $self->{jButton1}->setText("Save");
        $self->{jButton1}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71869 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->jButton1ActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71869'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71869'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71869')
        });
        $self->{upJButton}->setText("Up");
        $self->{upJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72008 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->upJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72008'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72008'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72008')
        });
        $self->{downJButton}->setText("Down");
        $self->{downJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72147 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->downJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72147'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72147'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72147')
        });
        $self->{fudgeItJButton}->setText("Fudge It!");
        $self->{fudgeItJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72286 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->fudgeItJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72286'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72286'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72286')
        });
        $self->{jLabel2}->setText("Columns:");
        $self->{columnsJTextField}->setText($commonPhoneStrings->{TWO});
        $self->{columnsJTextField}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72467 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->columnsJTextFieldActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72467'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72467'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72467')
        });
        $self->{columnsJTextField}->addPropertyChangeListener(do {
            package java::beans::PropertyChangeListener::AnonymousN72576 { our @ISA = ('java::beans::PropertyChangeListener', 'java::lang::Object');
            

            sub propertyChange {
                my ($self, $evt) = @_;
                $self->columnsJTextFieldPropertyChange($evt);
            }
            }
            'java::beans::PropertyChangeListener::AnonymousN72576'->can('new') ? 'java::beans::PropertyChangeListener::AnonymousN72576'->new() : bless({}, 'java::beans::PropertyChangeListener::AnonymousN72576')
        });
        $self->{columnsJTextField}->addKeyListener(do {
            package java::awt::event::KeyAdapter::AnonymousN72685 { our @ISA = ('java::awt::event::KeyAdapter', 'java::lang::Object');
            

            sub keyPressed {
                my ($self, $evt) = @_;
                $self->columnsJTextFieldKeyPressed($evt);
            }
            

            sub keyTyped {
                my ($self, $evt) = @_;
                $self->columnsJTextFieldKeyTyped($evt);
            }
            }
            'java::awt::event::KeyAdapter::AnonymousN72685'->can('new') ? 'java::awt::event::KeyAdapter::AnonymousN72685'->new() : bless({}, 'java::awt::event::KeyAdapter::AnonymousN72685')
        });
        $self->{jLabel1}->setText("Rows:");
        $self->{rowsJTextField}->setText($commonPhoneStrings->{TWO});
        $self->{rowsJTextField}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72934 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->rowsJTextFieldActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72934'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72934'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72934')
        });
        $self->{jLabel3}->setText("Cell Width:");
        $self->{cellWidthJTextField}->setText("200");
        $self->{cellWidthJTextField}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN73103 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->cellWidthJTextFieldActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN73103'->can('new') ? 'java::awt::event::ActionListener::AnonymousN73103'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN73103')
        });
        $self->{jLabel4}->setText("Cell Height:");
        $self->{cellHeightJTextField}->setText("150");
        $self->{cellHeightJTextField}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN73272 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->cellHeightJTextFieldActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN73272'->can('new') ? 'java::awt::event::ActionListener::AnonymousN73272'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN73272')
        });
        $self->{jLabel5}->setText("Cell Ratio:");
        $self->{cellRatioJTextField}->setEditable(0);
        $self->{jLabel6}->setText("Avg Image Ratio:");
        $self->{avgRatioJTextField}->setEditable(0);
        $self->{jButton2}->setText($self->{commonStrings}->{UPDATE});
        $self->{jButton2}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN73546 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->jButton2ActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN73546'->can('new') ? 'java::awt::event::ActionListener::AnonymousN73546'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN73546')
        });
        $self->{jButtonOrder}->setText("Order");
        $self->{jButtonOrder}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN73685 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->jButtonOrderActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN73685'->can('new') ? 'java::awt::event::ActionListener::AnonymousN73685'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN73685')
        });
        my $jPanel1Layout = 'javax::swing::GroupLayout'->new($self->{jPanel1});
        $self->{jPanel1}->setLayout($jPanel1Layout);
        $jPanel1Layout->setHorizontalGroup($jPanel1Layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($javax::swing::GroupLayout::Alignment->{TRAILING}, $jPanel1Layout->createSequentialGroup()->addContainerGap()->addGroup($jPanel1Layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{TRAILING})->addComponent($self->{jButton1}, $javax::swing::GroupLayout::DEFAULT_SIZE, 151, 32767)->addGroup($jPanel1Layout->createSequentialGroup()->addComponent($self->{upJButton}, $javax::swing::GroupLayout::PREFERRED_SIZE, 71, $javax::swing::GroupLayout::PREFERRED_SIZE)->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED}, 10, 32767)->addComponent($self->{downJButton}, $javax::swing::GroupLayout::PREFERRED_SIZE, 70, $javax::swing::GroupLayout::PREFERRED_SIZE))->addComponent($self->{fudgeItJButton}, $javax::swing::GroupLayout::Alignment->{LEADING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 151, 32767)->addGroup($javax::swing::GroupLayout::Alignment->{LEADING}, $jPanel1Layout->createSequentialGroup()->addComponent($self->{jLabel3})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED}, 99, $javax::swing::GroupLayout::PREFERRED_SIZE))->addGroup($javax::swing::GroupLayout::Alignment->{LEADING}, $jPanel1Layout->createSequentialGroup()->addComponent($self->{jLabel4})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED}, 96, $javax::swing::GroupLayout::PREFERRED_SIZE))->addComponent($self->{avgRatioJTextField}, $javax::swing::GroupLayout::Alignment->{LEADING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 151, 32767)->addComponent($self->{jLabel6}, $javax::swing::GroupLayout::Alignment->{LEADING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 151, 32767)->addComponent($self->{cellRatioJTextField}, $javax::swing::GroupLayout::Alignment->{LEADING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 151, 32767)->addComponent($self->{jLabel5}, $javax::swing::GroupLayout::Alignment->{LEADING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 151, 32767)->addComponent($self->{cellHeightJTextField}, $javax::swing::GroupLayout::Alignment->{LEADING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 151, 32767)->addComponent($self->{cellWidthJTextField}, $javax::swing::GroupLayout::Alignment->{LEADING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 151, 32767)->addComponent($self->{jButton2}, $javax::swing::GroupLayout::Alignment->{LEADING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 151, 32767)->addGroup($javax::swing::GroupLayout::Alignment->{LEADING}, $jPanel1Layout->createSequentialGroup()->addGroup($jPanel1Layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{jLabel2})->addComponent($self->{jLabel1}))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($jPanel1Layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{rowsJTextField}, $javax::swing::GroupLayout::DEFAULT_SIZE, 103, 32767)->addGroup($jPanel1Layout->createSequentialGroup()->addComponent($self->{columnsJTextField}, $javax::swing::GroupLayout::DEFAULT_SIZE, 102, 32767)->addGap(1, 1, 1))))->addComponent($self->{jButtonOrder}, $javax::swing::GroupLayout::DEFAULT_SIZE, 151, 32767))->addContainerGap()));
        $jPanel1Layout->setVerticalGroup($jPanel1Layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($jPanel1Layout->createSequentialGroup()->addContainerGap()->addComponent($self->{jButton1})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($jPanel1Layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{upJButton})->addComponent($self->{downJButton}))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{jButtonOrder})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{fudgeItJButton})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($jPanel1Layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{jLabel2})->addComponent($self->{columnsJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($jPanel1Layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{jLabel1})->addComponent($self->{rowsJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{jLabel3})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{cellWidthJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{jLabel4})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{cellHeightJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{jButton2})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{jLabel5})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED}, $javax::swing::GroupLayout::DEFAULT_SIZE, 32767)->addComponent($self->{cellRatioJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addGap(7, 7, 7)->addComponent($self->{jLabel6})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{avgRatioJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addGap(66, 66, 66)));
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jScrollPane1}, $javax::swing::GroupLayout::PREFERRED_SIZE, 84, $javax::swing::GroupLayout::PREFERRED_SIZE)->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{jPanel1}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{jScrollPane2}, $javax::swing::GroupLayout::DEFAULT_SIZE, 527, 32767)));
        $layout->setVerticalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($javax::swing::GroupLayout::Alignment->{TRAILING}, $layout->createSequentialGroup()->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{TRAILING})->addComponent($self->{jPanel1}, $javax::swing::GroupLayout::Alignment->{LEADING}, 0, 445, 32767)->addComponent($self->{jScrollPane2}, $javax::swing::GroupLayout::Alignment->{LEADING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 445, 32767)->addComponent($self->{jScrollPane1}, $javax::swing::GroupLayout::Alignment->{LEADING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 445, 32767))->addContainerGap()));
}


sub jButton2ActionPerformed {
    my ($self, $evt) = @_;
        $self->updateOnPropertiesChange();
}


sub columnsJTextFieldKeyPressed {
    my ($self, $evt) = @_;
}


sub columnsJTextFieldKeyTyped {
    my ($self, $evt) = @_;
}


sub columnsJTextFieldPropertyChange {
    my ($self, $evt) = @_;
}


sub fudgeItJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->updateImageWithFudgedImages();
}


sub cellHeightJTextFieldActionPerformed {
    my ($self, $evt) = @_;
        $self->updateOnPropertiesChange();
}


sub cellWidthJTextFieldActionPerformed {
    my ($self, $evt) = @_;
        $self->updateOnPropertiesChange();
}


sub columnsJTextFieldActionPerformed {
    my ($self, $evt) = @_;
        $self->updateOnPropertiesChange();
}


sub rowsJTextFieldActionPerformed {
    my ($self, $evt) = @_;
        $self->updateOnPropertiesChange();
}


sub jButton1ActionPerformed {
    my ($self, $evt) = @_;
        try {
            my $fileArray = $self->{imageProcessorInput}->getFiles();
            my $file = $fileArray->[0];
            my $filePath = $file->getAbsolutePath();
            my $extensionIndex = index($filePath, $self->{imageStrings}->{PNG_EXTENSION});
            $filePath = 'org::allbinary::logic::string::StringMaker'->new()->append(substr($filePath, 0, ($extensionIndex) - (0)))->append('org::allbinary::string::CommonSeps'->getInstance()->{UNDERSCORE})->appendint(int($self->{imageUnifierProperties}->getColumns()))->append("_By_")->appendint(int($self->{imageUnifierProperties}->getRows()))->append("_Unified")->append($self->{imageStrings}->{PNG_EXTENSION})->toString();
            $self->{logUtil}->putF("New File Path: " . $filePath, $self, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            my $outputFile = 'java::io::File'->new($filePath);
            'org::allbinary::media::image::ImagePersistanceUtil'->getInstance()->saveWithBatik('org::allbinary::logic::io::file::FileWrapperUtil'->wrapFile($outputFile), $self->{result});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "jButton1ActionPerformed", $e);
        }
}


sub downJButtonActionPerformed {
    my ($self, $evt) = @_;
        my $index = $self->{imageJList}->getSelectedIndex();
        my $defaultListModel = $self->{imageJList}->getModel();
        if ($index >= 0 && $index + 1 < $defaultListModel->size()) {
            my $indexedImageIcon = $defaultListModel->remove($index);
            $defaultListModel->insertElementAt($indexedImageIcon, $index + 1);
            $self->{imageJList}->setSelectedIndex($index + 1);
            $self->updateImage();
        }
}


sub upJButtonActionPerformed {
    my ($self, $evt) = @_;
        my $index = $self->{imageJList}->getSelectedIndex();
        if ($index > 0) {
            my $defaultListModel = $self->{imageJList}->getModel();
            my $indexedImageIcon = $defaultListModel->remove($index);
            $defaultListModel->insertElementAt($indexedImageIcon, $index - 1);
            $self->{imageJList}->setSelectedIndex($index - 1);
            $self->updateImage();
        }
}


sub jButtonOrderActionPerformed {
    my ($self, $evt) = @_;
        my $defaultListModel = $self->{imageJList}->getModel();
        my $size = $defaultListModel->size();
        my $last = $size - 1;
        for (my $index = $last; $index >= 0; $index--) {
            my $indexedImageIcon = $defaultListModel->remove($last);
            $defaultListModel->insertElementAt($indexedImageIcon, $last - $index);
        }
        if ($size > 0) {
            $self->{imageJList}->setSelectedIndex(0);
            $self->updateImage();
        }
}


sub getImageProcessorInput {
    my ($self) = @_;
        return $self->{imageProcessorInput};
}


sub setImageProcessorInput {
    my ($self, $imageProcessorInput) = @_;
        $self->{imageProcessorInput} = $imageProcessorInput;
        $self->init();
}

use java::lang::Object ();
# use java::awt::image::BufferedImage ();
use java::io::File ();
# use javax::swing::DefaultListModel ();
# use javax::swing::ImageIcon ();
# use javax::swing::Icon ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::io::file::FileWrapperUtil ();
use org::allbinary::logic::string::StringMaker ();
use org::allbinary::logic::string::StringUtil ();
use org::allbinary::media::image::ImagePersistanceUtil ();
use org::allbinary::media::image::ImageProcessorInput ();
use org::allbinary::media::image::ImageProcessorInputCompositeInterface ();
use org::allbinary::media::image::ImageStrings ();
use org::allbinary::media::image::ImageUnifierCell ();
use org::allbinary::media::image::ImageUnifierProperties ();
use org::allbinary::media::image::ImageUnifierUtil ();
use org::allbinary::media::image::ImageUtil ();
use org::allbinary::media::image::ImagesRatioUtil ();
use org::allbinary::string::CommonPhoneStrings ();
use org::allbinary::string::CommonSeps ();
use org::allbinary::string::CommonStrings ();
# use java::awt::Dimension ();
# use java::awt::event::ActionEvent ();
# use java::awt::event::ActionListener ();
# use java::awt::event::KeyAdapter ();
# use java::awt::event::KeyEvent ();
# use java::beans::PropertyChangeEvent ();
# use java::beans::PropertyChangeListener ();
# use javax::swing::GroupLayout ();
# use javax::swing::JButton ();
# use javax::swing::JLabel ();
# use javax::swing::JList ();
# use javax::swing::JPanel ();
# use javax::swing::JScrollPane ();
# use javax::swing::JTextField ();
# use javax::swing::LayoutStyle ();
use org::allbinary::image::gui::ImageIconUnique ();

1;

