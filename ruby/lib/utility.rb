# Created by Satoshi Nakagawa.
# You can redistribute it and/or modify it under the same terms as Ruby.

class String
  def first_char
    self.scan(/./)[0]
  end
  
  def each_char
    self.scan(/./) {|c| yield c }
  end
  
  def token!
    if / *([^ ]+) */ =~ self
      self[0...$&.length] = ''
      $1
    else
      self.replace('')
    end
  end
  
  def channelname?
    if /\A[#&+!]/ =~ self
      true
    else
      false
    end
  end
  
  def modechannelname?
    if /\A[#&!]/ =~ self
      true
    else
      false
    end
  end
  
  def server?
    self.index('.') != nil
  end
  
  def expand_path
    OSX::NSString.stringWithString(self).stringByExpandingTildeInPath.to_s
  end
end

class True
  def to_i; 1; end
end

class False
  def to_i; 0; end
end

class Fixnum
  def grouped_by_comma
    s = to_s
    nil while s.gsub!(/(.*\d)(\d\d\d)/, '\1,\2')
    s
  end
end

class Bignum
  def grouped_by_comma
    s = to_s
    nil while s.gsub!(/(.*\d)(\d\d\d)/, '\1,\2')
    s
  end
end

module OSX
  class NSPoint
    def dup; NSPoint.new(self.x, self.y); end
  end
  
  class NSSize
    def dup; NSSize.new(self.width, self.height); end
  end
  
  class NSRect
    def dup; NSRect.new(self.origin, self.size); end
  end
end
