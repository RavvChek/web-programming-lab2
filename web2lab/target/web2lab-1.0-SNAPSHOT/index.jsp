<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="assets/logo.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="stylesheets/main.css">
    <title>ravvcheck -- project</title>
</head>
<body>
<table id="page">
    <tbody>
    <tr>
        <th id="head" colspan="2">
            <h1>Bayanov Ravil * P3234</h1>
            <br>
            <h2>lab2 * Variant 3405</h2>
            <hr>
        </th>
    </tr>
    <tr>
        <td id="graph">
            <div class="top">
                <h2>Graph</h2>
            </div>
            <div id="image">
                <svg width="300" height="300" xmlns="http://www.w3.org/2000/svg">
                    <line stroke="#Edf5e1" x1="0" x2="300" y1="150" y2="150"></line>
                    <line stroke="#Edf5e1" x1="150" x2="150" y1="0" y2="300"></line>
                    <polygon fill="#Edf5e1" points="150,0 144,15 156,15" stroke="#Edf5e1"></polygon>
                    <polygon fill="#Edf5e1" points="300,150 285,156 285,144" stroke="#Edf5e1"></polygon>

                    <line stroke="#Edf5e1" x1="200" x2="200" y1="155" y2="145"></line>
                    <line stroke="#Edf5e1" x1="250" x2="250" y1="155" y2="145"></line>

                    <line stroke="#Edf5e1" x1="50" x2="50" y1="155" y2="145"></line>
                    <line stroke="#Edf5e1" x1="100" x2="100" y1="155" y2="145"></line>

                    <line stroke="#Edf5e1" x1="145" x2="155" y1="100" y2="100"></line>
                    <line stroke="#Edf5e1" x1="145" x2="155" y1="50" y2="50"></line>

                    <line stroke="#Edf5e1" x1="145" x2="155" y1="200" y2="200"></line>
                    <line stroke="#Edf5e1" x1="145" x2="155" y1="250" y2="250"></line>


                    <text fill="#Edf5e1" x="195" y="140">R/2</text>
                    <text fill="#Edf5e1" x="248" y="140">R</text>

                    <text fill="#Edf5e1" x="40" y="140">-R</text>
                    <text fill="#Edf5e1" x="90" y="140">-R/2</text>

                    <text fill="#Edf5e1" x="160" y="105">R/2</text>
                    <text fill="#Edf5e1" x="160" y="55">R</text>

                    <text fill="#Edf5e1" x="160" y="205">-R/2</text>
                    <text fill="#Edf5e1" x="160" y="255">-R</text>

                    <text fill="#Edf5e1" x="160" y="10">Y</text>
                    <text fill="#Edf5e1" x="290" y="140">X</text>

                    <polygon fill="#05386B"
                             fill-opacity="0.5"
                             points="250 250, 250 150, 150 150, 150 250"
                             stroke="#Edf5e1"></polygon>


                    <polygon fill="#05386B"
                             fill-opacity="0.5"
                             points="150 50, 150 150, 50 150"
                             stroke="#Edf5e1"></polygon>


                    <path d="M 100 150 A 50 50, 90, 0, 0, 150 200 L 150 150 Z"
                          fill="#05386B"
                          fill-opacity="0.5"
                          stroke="#Edf5e1"></path>


                    <circle cx="150" cy="150" id="target-dot" r="0" stroke="white" fill="#Edf5e1"></circle>
                </svg>
            </div>
        </td>
        <td id="table" rowspan="2">
            <div class="top">
                <h2>Table</h2>
            </div>
            <div id="resultTable">
                <table>
                    <thead>
                    <tr id="thead">
                        <th class="column-type1">X</th>
                        <th class="column-type1">Y</th>
                        <th class="column-type1">R</th>
                        <th class="column-type2">Hit Result</th>
                        <th class="column-type3">Current Time</th>
                        <th class="column-type3">Execution Time</th>
                    </tr>
                    </thead>
                    <tbody class="tbody">
                    <jsp:useBean id="results" scope="application" class="ru.ravvcheck.web2lab.beans.Results"/>
                    <c:forEach var="hit" items="${results.getResults()}">
                        <tr>
                            <td class="table-result">${hit.getX()}</td>
                            <td class="table-result">${hit.getY()}</td>
                            <td class="table-result">${hit.getR()}</td>
                            <td class="table-result">${hit.isHit()}</td>
                            <td class="table-result">${hit.getCurrentTime()}</td>
                            <td class="table-result">${hit.getExecutionTime()}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td id="coordinates">
            <div class="top">
                <h2>Coordinates</h2>
            </div>
            <div id="form">
                <div id="input">
                    <form method="post">
                        <table id="input-table">
                            <tbody>
                            <tr>
                                <td class="label">
                                    <label class="x" for="x">Value X:</label>
                                </td>
                                <td>
                                    <input id="x" type="text" autocomplete="off" placeholder="from -5 to 5" name="x"
                                           maxlength="5">
                                </td>
                            </tr>
                            <tr>
                                <td class="label">
                                    <label class="y" for="y">Value Y:</label>
                                </td>
                                <td>
                                    <input id="y" type="text" autocomplete="off" placeholder="from -5 to 5" name="y"
                                           maxlength="5">
                                </td>
                            </tr>
                            <tr>
                                <td class="label">
                                    <label for="r">Value R:</label>
                                </td>
                                <td>
                                    <select name="r" id="r">
                                        <option value="1" class="option">1</option>
                                        <option value="2" class="option">2</option>
                                        <option value="3" class="option">3</option>
                                        <option value="4" class="option">4</option>
                                        <option value="5" class="option">5</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="buttons">
                                        <input id="submit" type="submit" value="Check" class="button">
                                        <input id="reset" type="reset" value="Reset" class="button">
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </td>
    <tr>
        <td class="end" colspan="2">
            ITMO, 2023 ravvcheck
        </td>
    </tr>
    </tbody>
</table>
<script type="text/javascript"
        src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous">
</script>
<script type=module src="${pageContext.request.contextPath}/scripts/index.js"></script>
</body>
</html>