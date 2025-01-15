import 'package:flutter/material.dart';
import 'package:highlight/src/common_modes.dart';
import 'package:highlight/src/mode.dart';

final sql = Mode(
    refs: {},
    aliases: ["sql"],
    keywords:
        "SELECT INSERT UPDATE DELETE FROM WHERE JOIN INNER OUTER LEFT RIGHT ON GROUP BY HAVING ORDER ASC DESC LIMIT DISTINCT AS SET VALUES CREATE TABLE DROP ALTER INDEX VIEW TRIGGER PROCEDURE FUNCTION IF THEN ELSE CASE WHEN ELSE NULL TRUE FALSE",
    illegal: "<\\/|#",
    contains: [
      C_LINE_COMMENT_MODE,
      C_BLOCK_COMMENT_MODE,
      APOS_STRING_MODE,
      QUOTE_STRING_MODE,
      Mode(
          className: "number",
          begin: "\\b[0-9]+(\\.[0-9]+)?([eE][-+]?[0-9]+)?",
          relevance: 0),
      Mode(
        className: "string",
        begin: "'",
        end: "'",
        contains: [Mode(className: "escape", begin: "''")],
      ),
      Mode(
          className: "function",
          begin: "[A-Z_]+\\s*\\(",
          returnBegin: true,
          end: "\\)",
          excludeEnd: true,
          keywords: "COUNT AVG SUM MIN MAX",
          contains: [Mode(className: "params", begin: "\\(", end: "\\)")]),
      Mode(className: "meta", begin: "@[A-Za-z_]+")
    ]);

const sqlTheme = {
  'root':
      TextStyle(backgroundColor: Color(0xff23241f), color: Color(0xfff8f8f2)),
  'tag': TextStyle(color: Color(0xfff8f8f2)),
  'subst': TextStyle(color: Color(0xfff8f8f2)),
  'strong': TextStyle(color: Color(0xffa8a8a2), fontWeight: FontWeight.bold),
  'emphasis': TextStyle(color: Color(0xffa8a8a2), fontStyle: FontStyle.italic),
  'bullet': TextStyle(color: Color(0xffae81ff)),
  'quote': TextStyle(color: Color(0xffae81ff)),
  'number': TextStyle(color: Color(0xffae81ff)),
  'regexp': TextStyle(color: Color(0xffae81ff)),
  'literal': TextStyle(color: Color(0xffae81ff)),
  'link': TextStyle(color: Color(0xffae81ff)),
  'code': TextStyle(color: Color(0xffa6e22e)),
  'title': TextStyle(color: Color(0xffa6e22e)),
  'section': TextStyle(color: Color(0xffa6e22e)),
  'selector-class': TextStyle(color: Color(0xffa6e22e)),
  'keyword': TextStyle(color: Color(0xfff9ad3f)),
  'selector-tag': TextStyle(color: Color(0xfff92672)),
  'name': TextStyle(color: Color(0xfff92672)),
  'attr': TextStyle(color: Color(0xfff92672)),
  'symbol': TextStyle(color: Color(0xff66d9ef)),
  'attribute': TextStyle(color: Color(0xff66d9ef)),
  'params': TextStyle(color: Color(0xfff8f8f2)),
  'string': TextStyle(color: Color(0xffe6db74)),
  'type': TextStyle(color: Color(0xffe6db74)),
  'built_in': TextStyle(color: Color(0xffe6db74)),
  'builtin-name': TextStyle(color: Color(0xffe6db74)),
  'selector-id': TextStyle(color: Color(0xffe6db74)),
  'selector-attr': TextStyle(color: Color(0xffe6db74)),
  'selector-pseudo': TextStyle(color: Color(0xffe6db74)),
  'addition': TextStyle(color: Color(0xffe6db74)),
  'variable': TextStyle(color: Color(0xffe6db74)),
  'template-variable': TextStyle(color: Color(0xffe6db74)),
  'comment': TextStyle(color: Color(0xff75715e)),
  'deletion': TextStyle(color: Color(0xff75715e)),
  'meta': TextStyle(color: Color(0xff75715e)),
};
