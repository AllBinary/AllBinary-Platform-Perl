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

#JOGLEToKhronosGL10
package org::allbinary::opengles::JOGL10;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::khronos::opengles::GL10';


sub _init_fields {
    my ($self) = @_;
    $self->{RED} = "red: ";
    $self->{GREEN} = " green: ";
    $self->{BLUE} = " blue: ";
    $self->{ALPHA} = " alpha: ";
    $self->{PNAME} = "pname: ";
    $self->{_PNAME} = " pname: ";
    $self->{PARAM} = " param: ";
    $self->{PARAMS} = " params: ";
    $self->{LIGHT} = "light: ";
    $self->{FACE} = "face: ";
    $self->{TARGET} = "target: ";
    $self->{gl10} = undef;
    $self->{glu} = undef;
    $self->{GL_LINE} = undef;
    $self->{GL_QUAD_STRIP} = undef;
}


sub new {
    my ($class, $gl, $gl2) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{gl10} = $gl2;
        $self->{glu} = 'com::jogamp::opengl::glu::GLU'->createGLU($self->{gl10});
        $self->{GL_LINE} = $org::allbinary::opengles::com::jogamp->{opengl}->{GL2}->{GL_LINE};
        $self->{GL_QUAD_STRIP} = $org::allbinary::opengles::com::jogamp->{opengl}->{GL2}->{GL_QUAD_STRIP};
    return $self;
}


sub getJOGLGL {
    my ($self) = @_;
        return $self->{gl10};
}


sub glActiveTexture {
    my ($self, $texture) = @_;
        $self->{gl10}->glActiveTexture($texture);
}


sub glAlphaFunc {
    my ($self, $func, $ref) = @_;
        $self->{gl10}->glAlphaFunc($func, $ref);
}


sub glBindTexture {
    my ($self, $target, $texture) = @_;
        $self->{gl10}->glBindTexture($target, $texture);
}


sub glBlendFunc {
    my ($self, $sfactor, $dfactor) = @_;
        $self->{gl10}->glBlendFunc($sfactor, $dfactor);
}


sub glClear {
    my ($self, $mask) = @_;
        $self->{gl10}->glClear($mask);
}


sub glClearColor {
    my ($self, $red, $green, $blue, $alpha) = @_;
        $self->{gl10}->glClearColor($red, $green, $blue, $alpha);
}


sub glClearDepthf {
    my ($self, $depth) = @_;
        $self->{gl10}->glClearDepthf($depth);
}


sub glClearStencil {
    my ($self, $s) = @_;
        $self->{gl10}->glClearStencil($s);
}


sub glClientActiveTexture {
    my ($self, $texture) = @_;
        $self->{gl10}->glClientActiveTexture($texture);
}


sub glColor4f {
    my ($self, $red, $green, $blue, $alpha) = @_;
        $self->{gl10}->glColor4f($red, $green, $blue, $alpha);
}


sub glColorMask {
    my ($self, $red, $green, $blue, $alpha) = @_;
        $self->{gl10}->glColorMask($red, $green, $blue, $alpha);
}


sub glColorPointer {
    my ($self, $size, $type, $stride, $pointer) = @_;
        $self->{gl10}->glColorPointer($size, $type, $stride, $pointer);
}


sub glCompressedTexImage2D {
    my ($self, $target, $level, $internalformat, $width, $height, $border, $imageSize, $data) = @_;
        $self->{gl10}->glCompressedTexImage2D($target, $level, $internalformat, $width, $height, $border, $imageSize, $data);
}


sub glCompressedTexSubImage2D {
    my ($self, $target, $level, $xoffset, $yoffset, $width, $height, $format, $imageSize, $data) = @_;
        $self->{gl10}->glCompressedTexSubImage2D($target, $level, $xoffset, $yoffset, $width, $height, $format, $imageSize, $data);
}


sub glCopyTexImage2D {
    my ($self, $target, $level, $internalformat, $x, $y, $width, $height, $border) = @_;
        $self->{gl10}->glCopyTexImage2D($target, $level, $internalformat, $x, $y, $width, $height, $border);
}


sub glCopyTexSubImage2D {
    my ($self, $target, $level, $xoffset, $yoffset, $x, $y, $width, $height) = @_;
        $self->{gl10}->glCopyTexSubImage2D($target, $level, $xoffset, $yoffset, $x, $y, $width, $height);
}


sub glCullFace {
    my ($self, $mode) = @_;
        $self->{gl10}->glCullFace($mode);
}


sub glDeleteTextures {
    my ($self, $n, $textures, $offset) = @_;
        $self->{gl10}->glDeleteTextures($n, $textures, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glDeleteTextures {
    my ($self, $n, $textures) = @_;
        $self->{gl10}->glDeleteTextures($n, $textures);
}


sub glDepthFunc {
    my ($self, $func) = @_;
        $self->{gl10}->glDepthFunc($func);
}


sub glDepthMask {
    my ($self, $flag) = @_;
        $self->{gl10}->glDepthMask($flag);
}


sub glDepthRangef {
    my ($self, $zNear, $zFar) = @_;
        $self->{gl10}->glDepthRangef($zNear, $zFar);
}


sub glDisable {
    my ($self, $cap) = @_;
        $self->{gl10}->glDisable($cap);
}


sub glDisableClientState {
    my ($self, $array) = @_;
        $self->{gl10}->glDisableClientState($array);
}


sub glDrawArrays {
    my ($self, $mode, $first, $count) = @_;
        $self->{gl10}->glDrawArrays($mode, $first, $count);
}


sub glDrawElements {
    my ($self, $mode, $count, $type, $indices) = @_;
        $self->{gl10}->glDrawElements($mode, $count, $type, $indices);
}


sub glEnable {
    my ($self, $cap) = @_;
        $self->{gl10}->glEnable($cap);
}


sub glEnableClientState {
    my ($self, $array) = @_;
        $self->{gl10}->glEnableClientState($array);
}


sub glFinish {
    my ($self) = @_;
        $self->{gl10}->glFinish();
}


sub glFlush {
    my ($self) = @_;
        $self->{gl10}->glFlush();
}


sub glFogf {
    my ($self, $pname, $param) = @_;
        $self->{gl10}->glFogf($pname, $param);
}


sub glFogfv {
    my ($self, $pname, $params, $offset) = @_;
        $self->{gl10}->glFogfv($pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glFogfv {
    my ($self, $pname, $params) = @_;
        $self->{gl10}->glFogfv($pname, $params);
}


sub glFrontFace {
    my ($self, $mode) = @_;
        $self->{gl10}->glFrontFace($mode);
}


sub glFrustumf {
    my ($self, $left, $right, $bottom, $top, $zNear, $zFar) = @_;
        $self->{gl10}->glFrustumf($left, $right, $bottom, $top, $zNear, $zFar);
}


sub glGenTextures {
    my ($self, $n, $textures, $offset) = @_;
        $self->{gl10}->glGenTextures($n, $textures, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glGenTextures {
    my ($self, $n, $textures) = @_;
        $self->{gl10}->glGenTextures($n, $textures);
}


sub glGetError {
    my ($self) = @_;
        return $self->{gl10}->glGetError();
}


sub glGetIntegerv {
    my ($self, $pname, $params, $offset) = @_;
        $self->{gl10}->glGetIntegerv($pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glGetIntegerv {
    my ($self, $pname, $params) = @_;
        $self->{gl10}->glGetIntegerv($pname, $params);
}


sub glGetString {
    my ($self, $name) = @_;
        return $self->{gl10}->glGetString($name);
}


sub glHint {
    my ($self, $target, $mode) = @_;
        $self->{gl10}->glHint($target, $mode);
}


sub glLightModelf {
    my ($self, $pname, $param) = @_;
        $self->{gl10}->glLightModelf($pname, $param);
}


sub glLightModelfv {
    my ($self, $pname, $params, $offset) = @_;
        $self->{gl10}->glLightModelfv($pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glLightModelfv {
    my ($self, $pname, $params) = @_;
        $self->{gl10}->glLightModelfv($pname, $params);
}


sub glLightf {
    my ($self, $light, $pname, $param) = @_;
        $self->{gl10}->glLightf($light, $pname, $param);
}


sub glLightfv {
    my ($self, $light, $pname, $params, $offset) = @_;
        $self->{gl10}->glLightfv($light, $pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glLightfv {
    my ($self, $light, $pname, $params) = @_;
        $self->{gl10}->glLightfv($light, $pname, $params);
}


sub glLineWidth {
    my ($self, $width) = @_;
        $self->{gl10}->glLineWidth($width);
}


sub glLoadIdentity {
    my ($self) = @_;
        $self->{gl10}->glLoadIdentity();
}


sub glLoadMatrixf {
    my ($self, $m, $offset) = @_;
        $self->{gl10}->glLoadMatrixf($m, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glLoadMatrixf {
    my ($self, $m) = @_;
        $self->{gl10}->glLoadMatrixf($m);
}


sub glLogicOp {
    my ($self, $opcode) = @_;
        $self->{gl10}->glLogicOp($opcode);
}


sub glMaterialf {
    my ($self, $face, $pname, $param) = @_;
        $self->{gl10}->glMaterialf($face, $pname, $param);
}


sub glMaterialfv {
    my ($self, $face, $pname, $params, $offset) = @_;
        $self->{gl10}->glMaterialfv($face, $pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glMaterialfv {
    my ($self, $face, $pname, $params) = @_;
        $self->{gl10}->glMaterialfv($face, $pname, $params);
}


sub glMatrixMode {
    my ($self, $mode) = @_;
        $self->{gl10}->glMatrixMode($mode);
}


sub glMultMatrixf {
    my ($self, $m, $offset) = @_;
        $self->{gl10}->glMultMatrixf($m, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glMultMatrixf {
    my ($self, $m) = @_;
        $self->{gl10}->glMultMatrixf($m);
}


sub glMultiTexCoord4f {
    my ($self, $target, $s, $t, $r, $q) = @_;
        $self->{gl10}->glMultiTexCoord4f($target, $s, $t, $r, $q);
}


sub glNormal3f {
    my ($self, $nx, $ny, $nz) = @_;
        $self->{gl10}->glNormal3f($nx, $ny, $nz);
}


sub glNormalPointer {
    my ($self, $type, $stride, $pointer) = @_;
        $self->{gl10}->glNormalPointer($type, $stride, $pointer);
}


sub glOrthof {
    my ($self, $left, $right, $bottom, $top, $zNear, $zFar) = @_;
        $self->{gl10}->glOrthof($left, $right, $bottom, $top, $zNear, $zFar);
}


sub glPixelStorei {
    my ($self, $pname, $param) = @_;
        $self->{gl10}->glPixelStorei($pname, $param);
}


sub glPointSize {
    my ($self, $size) = @_;
        $self->{gl10}->glPointSize($size);
}


sub glPolygonOffset {
    my ($self, $factor, $units) = @_;
        $self->{gl10}->glPolygonOffset($factor, $units);
}


sub glPopMatrix {
    my ($self) = @_;
        $self->{gl10}->glPopMatrix();
}


sub glPushMatrix {
    my ($self) = @_;
        $self->{gl10}->glPushMatrix();
}


sub glReadPixels {
    my ($self, $x, $y, $width, $height, $format, $type, $pixels) = @_;
        $self->{gl10}->glReadPixels($x, $y, $width, $height, $format, $type, $pixels);
}


sub glRotatef {
    my ($self, $angle, $x, $y, $z) = @_;
        $self->{gl10}->glRotatef($angle, $x, $y, $z);
}


sub glRotatex {
    my ($self, $angle, $x, $y, $z) = @_;
        $self->{gl10}->glRotatef($angle, $x, $y, $z);
}


sub glSampleCoverage {
    my ($self, $value, $invert) = @_;
        $self->{gl10}->glSampleCoverage($value, $invert);
}


sub glScalef {
    my ($self, $x, $y, $z) = @_;
        $self->{gl10}->glScalef($x, $y, $z);
}


sub glScalex {
    my ($self, $x, $y, $z) = @_;
        $self->{gl10}->glScalef($x, $y, $z);
}


sub glScissor {
    my ($self, $x, $y, $width, $height) = @_;
        $self->{gl10}->glScissor($x, $y, $width, $height);
}


sub glShadeModel {
    my ($self, $mode) = @_;
        $self->{gl10}->glShadeModel($mode);
}


sub glStencilFunc {
    my ($self, $func, $ref, $mask) = @_;
        $self->{gl10}->glStencilFunc($func, $ref, $mask);
}


sub glStencilMask {
    my ($self, $mask) = @_;
        $self->{gl10}->glStencilMask($mask);
}


sub glStencilOp {
    my ($self, $fail, $zfail, $zpass) = @_;
        $self->{gl10}->glStencilOp($fail, $zfail, $zpass);
}


sub glTexCoordPointer {
    my ($self, $size, $type, $stride, $pointer) = @_;
        $self->{gl10}->glTexCoordPointer($size, $type, $stride, $pointer);
}


sub glTexEnvf {
    my ($self, $target, $pname, $param) = @_;
        $self->{gl10}->glTexEnvf($target, $pname, $param);
}


sub glTexEnvfv {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl10}->glTexEnvfv($target, $pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glTexEnvfv {
    my ($self, $target, $pname, $params) = @_;
        $self->{gl10}->glTexEnvfv($target, $pname, $params);
}


sub glTexImage2D {
    my ($self, $target, $level, $internalformat, $width, $height, $border, $format, $type, $pixels) = @_;
        $self->{gl10}->glTexImage2D($target, $level, $internalformat, $width, $height, $border, $format, $type, $pixels);
}


sub glTexParameterf {
    my ($self, $target, $pname, $param) = @_;
        $self->{gl10}->glTexParameterf($target, $pname, $param);
}


sub glTexParameteri {
    my ($self, $target, $pname, $param) = @_;
        $self->{gl10}->glTexParameteri($target, $pname, $param);
}


sub glTexSubImage2D {
    my ($self, $target, $level, $xoffset, $yoffset, $width, $height, $format, $type, $pixels) = @_;
        $self->{gl10}->glTexSubImage2D($target, $level, $xoffset, $yoffset, $width, $height, $format, $type, $pixels);
}


sub glTranslatef {
    my ($self, $x, $y, $z) = @_;
        $self->{gl10}->glTranslatef($x, $y, $z);
}


sub glVertexPointer {
    my ($self, $size, $type, $stride, $pointer) = @_;
        $self->{gl10}->glVertexPointer($size, $type, $stride, $pointer);
}


sub glViewport {
    my ($self, $x, $y, $width, $height) = @_;
        $self->{gl10}->glViewport($x, $y, $width, $height);
}


sub glBegin {
    my ($self, $i) = @_;
        $self->{gl10}->glBegin($i);
}


sub glEnd {
    my ($self) = @_;
        $self->{gl10}->glEnd();
}


sub glVertex3f {
    my ($self, $f, $f2, $f3) = @_;
        $self->{gl10}->glVertex3f($f, $f2, $f3);
}


sub glPolygonMode {
    my ($self, $i, $i1) = @_;
        $self->{gl10}->glPolygonMode($i, $i1);
}

use com::jogamp::opengl::glu::GLU;

1;

